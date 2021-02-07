class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  # accepts_nested_attributes_for :type

  def type_attributes=(attr)
    self.type = Type.find_or_create_by(name: attr[:name])
  end

end
