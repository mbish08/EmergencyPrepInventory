class Type < ApplicationRecord
    has_many :items
    has_many :users, through: :items
    belongs_to :user
    validates :name, uniqueness: { case_sensitive: false }
    validates :name, presence: true
    scope :alpha, -> { self.order(name: :asc) }

    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attribute|
            if item_attribute["name"].present?
                item = Item.find_or_create_by(item_attribute)
                self.items << item
            end
        end
    end

end
