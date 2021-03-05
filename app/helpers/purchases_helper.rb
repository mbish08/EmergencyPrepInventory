module PurchasesHelper

    # used for purchases/new
    def display_item_fields(t)
        if params[:item_id]
            t.hidden_field :item_id
        else
            render partial: 'item_select', locals: {f: t}
        end
    end

    # used in purchases/popular/view
    def display_top_three(purchases)
        @top_three = []
        purchases.each do | item, count | 
            item_find = Item.find_by(id: item)
            @top_three << [item_find.name, count]
        end
        @top_three
    end

end
