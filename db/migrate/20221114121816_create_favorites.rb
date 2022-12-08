class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :customer_id, null: false, foreign_key: true
      t.references :general_customer_id, null: false, foreign_key: true
      t.references :item_id, null: false, foreign_key: true


      t.timestamps

    end
  end
end
