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
    @item = current_user.items.build(item_params)
    @item.user_id = session[:user_id]
    if @item.save
        redirect_to item_path(@item)
    else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @purchase = Purchase.all.where(item_id: params[:id])
  end

  def index
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      @items = @type.items
    else
      @items = current_user.items
      purchase_item
      # byebug
    end
  end 

  def edit
    @item = Item.find(params[:item_id])
  end

  def update
    item = Item.find_by(id: params[:item_id])
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
