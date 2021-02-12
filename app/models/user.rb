class User < ApplicationRecord
    has_secure_password
    has_many :items 
    has_many :item_types, through: :items, source: :type
    has_many :purchases
    has_many :purchased_items, through: :purchases, source: :item
    has_many :types
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

    def self.create_from_omniauth(auth_hash)
        user = User.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |u|
            u.username = auth_hash['info']['first_name']
            u.email = auth_hash['info']['email']
            u.password = SecureRandom.hex(12)
        end
    end
end
