module PurchasesHelper

    def add_or_edit
        if @purchase
            link_to "Update the quantity of #{@item.name}", edit_item_purchase_path(@item)
        else
            link_to "Add the quantity of #{@item.name}", new_item_purchase_path(@item)
        end
    end

end
