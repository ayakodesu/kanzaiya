class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :customer_id, null: false
      t.string :telephone_number, null: false
      t.integer :general_customer_id

      t.timestamps
    end
  end
end
