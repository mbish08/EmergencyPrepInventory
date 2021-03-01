module PurchasesHelper

    # used for purchases/new
    def display_item_fields(t)
        if params[:item_id]
            t.hidden_field :item_id
        else
            render partial: 'item_select', locals: {f: t}
        end
    end

end
