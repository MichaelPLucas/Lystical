class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @list = List.find_by(id: @item.list_id)
    unless session[:current_user] and session[:current_user]["id"] === @list.user_id
      raise ActionController::RoutingError.new("Not found")
    end
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to "/lists/" + @item.list_id.to_s }
        format.json { render :show, status: :created, location: @item }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to "/lists/" + @item.list_id.to_s, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    list_id = @item.list_id
    @item.destroy
    respond_to do |format|
      format.html { redirect_to "/lists/" + list_id.to_s, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:list_id, :title, :description, :image, :price, :currency, :link)
    end
end
