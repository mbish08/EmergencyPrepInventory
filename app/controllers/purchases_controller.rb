class PurchasesController < ApplicationController

    # def new
    #     @purchase = Purchase.new
    #     byebug
    # end

    def new
        if params[:item_id] && @item = Item.find_by_id(params[:item_id])
          @purchase = Purchase.new
        end
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
        # byebug
        @purchase.item_id = purchase_params[:item_id]
        # byebug
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
