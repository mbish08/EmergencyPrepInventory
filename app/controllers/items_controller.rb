class ItemsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      # byebug
      @item = @type.items.build
    else
      @item = Item.new
      @item.build_type
    end
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.user_id = session[:user_id]
    byebug
    if @item.save
        redirect_to item_path(@item)
    else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @purchase = Purchase.all.where(item_id: params[:id])
    # byebug
  end

  def index
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      # byebug
      @items = @type.items.where(user_id: current_user.id)
    else
      @items = current_user.items
      # @types = Type.all
      # purchase_item
      # byebug
    end
  end 

  def edit
    # byebug
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find_by(id: params[:id])
    # byebug
    item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    # @purchase = Purchase.all.where(item_id: params[:id])
    # byebug
    # @purchase.destroy
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
