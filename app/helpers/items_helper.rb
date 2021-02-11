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

def display_items(type)
    if type
        "Here are your #{type.name} supplies:"
            @items.each do |item|
                "#{item.name}"
            end
    else
        current_user.types.uniq.each do |type|
            # byebug
            type.name
            type.items.collect do |item|
                # byebug
                "#{item.name} Quantity: #{item.quantity}"
        #         link_to "delete", item_path(item.id), method: :delete 
        #         link_to "edit", edit_item_path(item) 
        #          link_to #{item.name}, item_path(item) item.quantity
            end
        end
    
    end
end

end
