class AddColumnToType < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :user_id, :integer
  end
end
