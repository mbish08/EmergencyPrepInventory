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
        @top_three = []
        purchases.each do | item, count | 
            item_find = Item.find_by(id: item)
            # @item_name = item_find.name
            @top_three << [item_find.name, count]
            # @item_count = count
            # @top_three << count
            # byebug
        end
        # @top_three.each do |item, count|
        @top_three
        
        # byebug
        # end
    end

end
