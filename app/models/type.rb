class Type < ApplicationRecord
    has_many :items
    has_many :users
    has_many :users, through: :items
end
