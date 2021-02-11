class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :quantity

      t.timestamps
    end
  end
end
