class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  accepts_nested_attributes_for :type
  
end
