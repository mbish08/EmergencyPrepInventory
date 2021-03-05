module PurchasesHelper

    # used for purchases/new
    def display_item_fields(t)
        if params[:item_id]
            t.hidden_field :item_id
        else
            render partial: 'item_select', locals: {f: t}
        end
    end

    # used in popular view
    def display_top_three(purchases)
        purchases.each do | item, count | 
            item_find = Item.find_by(id: item)
            @item_name = item_find.name
            @item_count = count
            # byebug
        end
    end

end
