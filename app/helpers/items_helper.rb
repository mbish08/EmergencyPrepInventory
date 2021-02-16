module ItemsHelper

    def display_type_fields(t)
        if params[:type_id]
            t.hidden_field :type_id
        else
            render partial: 'type_select', locals: {f: t}
        end
    end

    def add_item_link
        if @type
            link_to "Add a new #{@type.name} supply", new_type_item_path(@type)
        else
            link_to "Add a new supply", new_item_path
        end
    end

    def purchase_quantity
        @purchase = Purchase.find_by(item_id: @item.id)
        if @purchase
            @purchase.quantity
        end
    end

    def items_show_links
        if purchase_quantity.nil?
            link_to "Add the quantity of #{@item.name}", new_item_purchase_path(@item)
        else
            link_to "Update the quantity of #{@item.name}", edit_item_purchase_path(@item)
        end
    end

    def purchase_quantity_index(item)
        @purchase = Purchase.find_by(item_id: item.id)
        if @purchase
            @purchase.quantity
        else
            "0"
        end
    end

end
