class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :quantity, uniqueness: { scope: :item }

  def purchase_attributes=(attr)
    if !attr[:purchase_id].blank?
      p = Purchase.find_or_create_by(purchase_id: attr[:purchase_id]) do |u|
        u.user_id = attr[:user_id]
        u.item_id = attr[:item_id]
      end
      self.item = p
    end
  end

end
