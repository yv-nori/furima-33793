class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_one    :order
  has_one    :address
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :perfecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :perfecture_id
    validates :scheduled_delivery_id
    validates :price, :only_integer, :greather_than 300, :less_than 9999999
  end
end
