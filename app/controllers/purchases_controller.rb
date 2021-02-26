class PurchasesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        # commented out items are the originals - will need to rework
        @purchase = Purchase.new
        # if params[:item_id] && @item = Item.find_by_id(params[:item_id])
        #   @purchase = Purchase.new
        # end
      end

    def edit
        @purchase = Purchase.find_by(item_id: params[:item_id])
    end

    def update
        purchase = Purchase.all.where(item_id: purchase_params[:item_id])
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

    private

    def purchase_params
        params.require(:purchase).permit(:quantity, :item_id, :user_id)
    end

end
