class Purchase < ApplicationRecord
    belongs_to :user
    belongs_to :item
    validates :quantity, uniqueness: true
end
