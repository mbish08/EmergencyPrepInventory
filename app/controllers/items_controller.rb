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
    # byebug
    @item = Item.new(item_params)
    # binding.pry
    @item.user_id = session[:user_id]
    # byebug
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
      @items = @type.items
      # byebug
    else
      @items = Item.all
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
    params.require(:item).permit(:name, :quantity, :user_id, :type_id, type_attributes: [:name])
  end


end
