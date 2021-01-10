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
end
