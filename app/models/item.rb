
class Item < ApplicationRecord
  
  belongs_to :user
  belongs_to :type
  has_many :users, through: :purchases
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, :type, presence: true
  # validates :quantity, numericality: { greater_than: 0, only_integer: true }
  # accepts_nested_attributes_for :purchases

  def type_attributes=(attr)
    if !attr[:name].blank?
      t = Type.find_or_create_by(name: attr[:name]) do |u|
        byebug
        u.user_id = attr[:user_id]
        # byebug
      end
      self.type = t
    end
    
  end

end
