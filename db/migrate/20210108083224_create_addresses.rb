class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false, default: ""
      t.integer    :prefecture_id, null: false, default: 0
      t.string     :city,          null: false, default: ""
      t.text       :addresses,     null: false
      t.text       :building,      null: false
      t.integer    :phone_number,  null: false
      t.references :item,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
