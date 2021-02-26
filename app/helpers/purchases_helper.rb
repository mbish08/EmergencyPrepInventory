module PurchasesHelper

    def add_or_edit
        if @purchase
            link_to "Update the quantity of #{@item.name}", edit_item_purchase_path(@item)
        else
            link_to "Add the quantity of #{@item.name}", new_item_purchase_path(@item)
        end
    end

    def display_item_fields(t)
        if params[:item_id]
            t.hidden_field :item_id
        else
            render partial: 'item_select', locals: {f: t}
        end
    end

    def purchase_item(purchases)
        purchases.each do |purchase|
            # byebug
            tag.ul 
                tag.li "#{purchase.item.name}"
        end
    end

    def purchase_type(purchases)
        purchases.each do |purchase|
            purchase.item.type
        end
    end

    def purchase_quantity(purchases)
        purchase.each do |purchase|
            purchase.quantity
        end
    end

end
