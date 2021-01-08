class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                   null: false, default: ""
      t.text       :info,                   null: false
      t.integer    :category_id,            null: false, default: 0
      t.integer    :sales_status_id,        null: false, default: 0
      t.integer    :shipping_fee_status_id, null: false, default: 0
      t.integer    :prefecture_id,          null: false, default: 0
      t.integer    :scheduled_delivery_id,  null: false, default: 0
      t.integer    :price,                  null: false, default: 0
      t.references :sale_user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
