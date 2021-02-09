class User < ApplicationRecord
    has_secure_password
    has_many :items 
    has_many :types, through: :items
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
