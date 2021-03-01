
class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :type
  has_many :users, through: :purchases
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :type, presence: true


  def type_attributes=(attr)
    if !attr[:name].blank?
      self.type = Type.find_or_create_by(attr)
    end
  end

  def purchases_attributes=(purchase_attributes)
    purchase_attributes.values.each do |purchase_attribute|
        if purchase_attribute["purchase_id"].present?
            purchase = Purchase.find_or_create_by(purchase_attribute)
            self.purchases << purchase
        end
    end
  end

end
