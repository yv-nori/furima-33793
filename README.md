# テーブル設計

## users テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_date      | date       | null: false                    |
### Association
- has_many :items
- has_many :orders

## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | references | null: false, foreign_key: true |
| sales_status        | references | null: false, foreign_key: true |
| shipping_fee_status | references | null: false, foreign_key: true |
| prefecture          | references | null: false, foreign_key: true |
| scheduled_delivery  | references | null: false, foreign_key: true |
| price               | integer    | null: false                    |
| sale_user           | references | null: false, foreign_key: true |
### Association
- belong_to :user
- has_one   :order
- has_one   :address

## orders テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| buy_user    | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one    :item

## addresses テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | references | null: false                    |
| city         | string     | null: false                    |
| addresses    | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    | null: false                    |
| item         | references | null: false, foreign_key: true |
### Association
- has_one :item
