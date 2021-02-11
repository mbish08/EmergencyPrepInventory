class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  # accepts_nested_attributes_for :type
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :quantity, presence: true

  def type_attributes=(attr)
    self.type = Type.find_or_create_by(name: attr[:name]) if !attr[:name].blank?
  end

end
