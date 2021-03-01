module ItemsHelper

    # this is for partial 'form'
    def display_type_fields(t)
        if params[:type_id]
            t.hidden_field :type_id
        else
            render partial: 'type_select', locals: {f: t}
        end
    end

    # currently being used on items/index 
    def add_item_link
        if @type
            link_to "Add a new #{@type.name} supply", new_type_item_path(@type)
        else
            link_to "Add a new supply", new_item_path
        end
    end

    # This is being used in items_show_links
    def purchase_quantity
        @purchase = Purchase.find_by(item_id: @item.id)
        if @purchase
            @purchase.quantity
        end
    end
    
    # used for items/show
    def items_show_links
        if purchase_quantity.nil?
            link_to "Add the quantity of #{@item.name}", new_item_purchase_path(@item)
        else
            link_to "Update the quantity of #{@item.name}", edit_item_purchase_path(@item)
        end
    end

    # currently used in items/index to display quantity of items
    def purchase_quantity_index(item)
        @purchase = Purchase.find_by(item_id: item.id)
        if @purchase
            @purchase.quantity
        else
            "0"
        end
    end

    # this is used to grab the name of the item but going thru purchases
    def purchase_item_name(item)
        Item.find_by(id: item.item_id).name
    end

end
