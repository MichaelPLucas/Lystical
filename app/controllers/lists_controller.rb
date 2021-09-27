class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
    @user = session[:current_user]
    if @list.visibility or (@user and @list.user_id == @user["id"])
      @items = Item.where(list_id: @list.id)
      @comments = Comment.where(list_id: @list.id)
    else
      raise ActionController::RoutingError.new("Not found")
    end
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @user = session[:current_user]
    unless @user and @user["id"] == @list.user_id
      raise ActionController::RoutingError.new("Not found")
    end
  end

  # GET /lists/search/:query
  def search
    @user = session[:current_user]
    @lists = List.where(['title LIKE "%%%s%%" AND (visibility = true OR %s = %s)',
                          list_params[:search].chars.join("%"),
                          @user ? "user_id" : "visibility",
                          @user ? @user["id"] : "true"])
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to "/lists/" + @list.id.to_s + "/edit" }
        format.json { render :show, status: :created, location: @lists }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to "/lists/" + @list.id.to_s, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    user_id = @list.user_id
    @list.destroy
    respond_to do |format|
      format.html { redirect_to "/users/" + user_id.to_s, notice: "List was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:user_id, :title, :description, :visibility, :search)
    end
end
