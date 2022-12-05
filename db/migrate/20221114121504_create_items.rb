class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction
      t.integer :last_price, null: false
      t.boolean :is_active, null: false, default: true
      t.string :shape
      t.integer :size
      t.integer :amount, null: false



      t.timestamps
    end
  end
end
