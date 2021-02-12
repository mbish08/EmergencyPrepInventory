class PurchasesController < ApplicationController

    def new
        @purchase = Purchase.new
        # @purchase.item_id = params[:item_id]
        # @purchase.user_id = session[:user_id]

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
        params.require(:purchase).permit(:quantity, :item_id, :user_id)
    end

end
