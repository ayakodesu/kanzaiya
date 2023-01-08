class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :general_customer_id
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :spot
      t.string :telephone_number, null: false
      t.integer :shipping_cost, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0


      t.timestamps
    end
  end
end
