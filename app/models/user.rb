class User < ApplicationRecord
    has_secure_password
    has_many :types
    has_many :items 
    has_many :types_items, through: :items
end
