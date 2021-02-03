class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :users, through: :types
  has_many :types, through: :users
end
