class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do
      t.string,     :postal_code,  null: false, default: ""
      t.references, :prefecture,   null: false, foreign_key: true
      t.string,     :city,         null: false, default: ""
      t.text,       :addresses,    null: false, default: ""
      t.text,       :building,     null: false, default: ""
      t.int,        :phone_number, null: false
      t.references, :item,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
