class ItemsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      @item = @type.items.build
    else
      @item = Item.new
      @item.build_type
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = session[:user_id]
    if @item.save
        redirect_to item_path(@item)
    else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      @items = @type.items.where(user_id: current_user.id)
    else
      @items = current_user.items
    end
  end 

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id, :type_id, :quantity, :purchased_items, type_attributes: [:name, :user_id])
  end
  
  def purchase_item
    @items = current_user.items
    @items.each do |item|
      # byebug
        purchase = Purchase.where("item_id = ?", item.id)
        @purchase = purchase
    end    
  end

end
