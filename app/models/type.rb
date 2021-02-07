class Type < ApplicationRecord
    has_many :items
    has_many :users, through: :items
    accepts_nested_attributes_for :items
    validates :name, uniqueness: { case_sensitive: false }
    validates :name, presence: true

    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attribute|
            if item_attribute["name"].present?
                item = Item.find_or_create_by(item_attribute)
                self.items << item
            end
        end
    end

end
