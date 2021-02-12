class PurchasesController < ApplicationController

    def new
        @purchase = Purchase.new
    end

    def create
        @purchase = Purchase.new(purchase_params)
        @purchase.user_id = session[:user_id]
        if @purchase.save
            redirect_to items_path
        else
            render :new
        end
    end

    private

    def purchase_params
        params.require(:purchase).permit(:quantity, :item_id, :user_id)
    end

end
