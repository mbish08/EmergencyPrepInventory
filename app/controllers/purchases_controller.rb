class PurchasesController < ApplicationController

    def new
        @purchase = Purchase.new
    end

    def edit
        # byebug
        @purchase = Purchase.find(params[:id])
    end

    def update
        purchase = Purchase.find_by(id: params[:id])
        purchase.update(purchase_params)
        # byebug
        redirect_to items_path
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
