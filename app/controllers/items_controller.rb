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
        redirect_to new_item_purchase_path(@item)
    else
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    if @item.nil? || @item.user_id != current_user[:id]
      flash[:message] = "This item does not exist or does not belong to you."
      redirect_to items_path
    end
  end

  def index
    if params[:type_id] && @type = Type.find_by_id(params[:type_id])
      @items = @type.items.where(user_id: current_user.id)
    else
      @items = items_by_purchase
    end
  end 

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id, :type_id, :quantity, :purchased_items, type_attributes: [:name, :user_id])
  end

  # used in items/index
  def items_by_purchase
    purchase = Purchase.where(user_id: current_user.id)
    purchase.each do |p|
      p.item
    end
  end

end
