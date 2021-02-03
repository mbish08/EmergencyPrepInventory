class Type < ApplicationRecord
    has_many :items
    has_many :users
    has_many :users_items, through: :items, source: :type_id
end
