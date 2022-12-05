class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :amount, null: false
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :general_customer_id
      t.string :shape
      t.integer :size

      t.timestamps
    end
  end
end
