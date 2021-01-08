class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                    null: false, default: ""
      t.text :info,                      null: false, default: ""
      t.references :category,            null: false, foreign_key: true
      t.references :sales_status,        null: false, foreign_key: true
      t.references :shipping_fee_status, null: false, foreign_key: true
      t.references :prefecture,          null: false, foreign_key: true
      t.references :scheduled_delivery,  null: false, foreign_key: true
      t.int :price,                      null: false, default: 0
      t.references :sale_user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
