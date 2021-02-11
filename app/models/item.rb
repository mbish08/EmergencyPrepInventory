class Item < ApplicationRecord
  belongs_to :user
  belongs_to :type
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :quantity, :type, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }

  def type_attributes=(attr)
    self.type = Type.find_or_create_by(name: attr[:name]) if !attr[:name].blank?
  end

end
