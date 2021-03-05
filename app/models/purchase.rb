class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :quantity, uniqueness: { scope: :item }
  validates :quantity, numericality: { greater_than_or_equal_to: 0, message: "must be a number." }

  def purchase_attributes=(attr)
    if !attr[:purchase_id].blank?
      p = Purchase.find_or_create_by(purchase_id: attr[:purchase_id]) do |u|
        u.user_id = attr[:user_id]
        u.item_id = attr[:item_id]
      end
      self.item = p
    end
  end

  def self.order_by_count
    # byebug
    # Purchase.left_outer_joins(:item).distinct.select('purchases.*, COUNT(item.*) AS items_count').group('purchases.id')
    # purchase = Purchase.left_outer_joins(:item)
    # purchase.each do |p|
    #   purchase.item_id

    # purchase = Purchase.left_outer_joins(:item).group(:item_id).count(:item_id)

    purchase = Purchase.left_outer_joins(:item).order("count_item_id").group(:item_id).count(:item_id)
    purchase = purchase.sort_by { |k, v| -v }.first(3)

    
    # byebug

#     purchase.sort_by do |p|
#       item = p[0]
#       count = p[1]
# byebug
#   end
    
    # purchase.each do |item, count|
    #   byebug

    # end


    # end
    
    # byebug
  
  end

end
