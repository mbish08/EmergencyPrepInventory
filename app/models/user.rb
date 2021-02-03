class User < ApplicationRecord
    has_secure_password
    has_many :types
    has_many :items 
end
