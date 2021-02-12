class PurchasesController < ApplicationController

    def new
        # byebug
        @item = Item.find_by_id(params[:item_id])
        @purchase = Purchase.new
    end

    def create
        # byebug
        @purchase = Purchase.new(purchase_params)
        @purchase.user_id = session[:user_id]
        # byebug
        if @purchase.save
            redirect_to items_path
        else
            render :new
        end
    end

    # t.integer "user_id"
    # t.integer "item_id"
    # t.string "quantity"

    private

    def purchase_params
        params.require(:purchase).permit(:quantity, :item_id)
    end

end
