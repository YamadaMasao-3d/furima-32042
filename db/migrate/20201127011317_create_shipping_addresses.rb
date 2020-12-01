class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,           null: false
      t.string :phone_number,          null: false
      t.text :municipality,            null: false
      t.text :address,                 null: false
      t.text :building_name,           null: false
      t.references :purchase_history,  null: false,  foreign_key: true
      t.integer :prefecture_id,        null: false

      t.timestamps
    end
  end
end
