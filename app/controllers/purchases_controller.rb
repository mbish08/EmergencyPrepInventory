class PurchasesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:item_id] && @item = Item.find_by_id(params[:item_id])
        #  byebug
            @purchase = Purchase.where(item_id: @item.id).build
        else
            @purchase = Purchase.new
            @purchase.build_item
        end
      end

    def edit
        # byebug
        @purchase = current_user.purchases.find_by(id: params[:id])
        if @purchase.nil?
            flash[:message] = "This is not your page, please choose from your list or add a new item."
            redirect_to items_path
        end
        # if params[:item_id] && @item = Item.find_by_id(params[:item_id])
        #     @purchase = current_user.purchases.find_by(item_id: params[:item_id])
        # else
        #     @purchase = Purchase.find_by_id(params[:id])
        # end
    end

    def update
        # byebug
        purchase = Purchase.all.where(id: params[:id])
        purchase.update(purchase_params)
        redirect_to items_path
    end

    def create
        @purchase = Purchase.new(purchase_params)
        @purchase.user_id = session[:user_id]
        @purchase.item_id = purchase_params[:item_id]
        if @purchase.save
            redirect_to items_path
        else
            render :new
        end
    end

    def index
        @purchases = current_user.purchases
        # byebug
        # @purchase_item = purchased_item(@purchases)
    end

    def show
        # byebug
        @purchase = Purchase.find_by(id: params[:id])
    end

    def destroy
        # byebug
        @purchase = Purchase.find(params[:id])
        @purchase.destroy
        redirect_to items_path
      end

    private

    def purchase_params
        params.require(:purchase).permit(:quantity, :item_id, :user_id)
    end

end
