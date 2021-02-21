
class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :type
  has_many :users, through: :purchases
  # validates :name, uniqueness: { case_sensitive: false, scope: :purchases_attributes }
  validates :name, :type, presence: true

  def type_attributes=(attr)
    if !attr[:name].blank?
      t = Type.find_or_create_by(name: attr[:name]) do |u|
        u.user_id = attr[:user_id]
      end
      self.type = t
    end
    
  end

  def purchases_attributes=(purchase_attributes)
    purchase_attributes.values.each do |purchase_attribute|
      byebug
        if purchase_attribute["purchase_id"].present?
            purchase = Purchase.find_or_create_by(purchase_attribute)
            self.purchases << purchase
        end
    end
end

end
