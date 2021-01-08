# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_08_083409) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postal_code", default: "", null: false
    t.integer "prefecture_id", default: 0, null: false
    t.string "city", default: "", null: false
    t.text "addresses", null: false
    t.text "building", null: false
    t.integer "phone_number", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_addresses_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "info", null: false
    t.integer "category_id", default: 0, null: false
    t.integer "sales_status_id", default: 0, null: false
    t.integer "shipping_fee_status_id", default: 0, null: false
    t.integer "prefecture_id", default: 0, null: false
    t.integer "scheduled_delivery_id", default: 0, null: false
    t.integer "price", default: 0, null: false
    t.bigint "sale_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sale_user_id"], name: "index_items_on_sale_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buy_user_id"
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buy_user_id"], name: "index_orders_on_buy_user_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.date "birth_date", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "items"
  add_foreign_key "items", "users", column: "sale_user_id"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users", column: "buy_user_id"
end
