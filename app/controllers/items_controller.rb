class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        @item = current_user.items.build(item_params)
        if @item.save
            redirect_to items_path
        else
            render :new
        end
    end

    private

    def item_params
        params.require(:item).permit(:title, :content)
    end

end
