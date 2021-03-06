class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    if @user.id != session[:current_user]["id"]
      raise ActionController::RoutingError.new("Not Found")
    else
      @lists = List.where(user_id: @user.id)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user] = @user;
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    session[:current_user] = nil
    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: "User was successfully deleted." }
      format.json { head :no_content }
    end
  end

  # POST /users/login or /users/login.json
  def login
    @user = User.find_by(email: user_params["email"])
    respond_to do |format|
      if @user and @user["password"] === user_params["password"]
        session[:current_user] = @user
        format.html { redirect_to '/' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: { "error": "Invalid email or password" }, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
