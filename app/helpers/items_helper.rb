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

# def index_display(user)
#     if @type 
#     "Here are your #{@type.name} supplies:"
    
#         tag.ul
#         @items.each do |item|
#             tag.li "#{item.name}""
#         end
    
#     else
#         tag.dl
#         user.types.uniq.each do |type|
#             "#{type.name}"
#             type.items.collect do |item|
#                 # link_to("delete", item, :method => :delete) "link_to "edit", edit_item_path(item)"  "Amount of link_to "#{item.name}"", item_path(item)
#             end
#         end
#     end
# end
    

end
