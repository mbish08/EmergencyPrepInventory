class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.build_type
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.user_id = session[:user_id]
    # binding.pry
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
    @user = current_user
    @items = Item.all
  end 

  def edit

  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :user_id, type_attributes: [:name])
  end


end
