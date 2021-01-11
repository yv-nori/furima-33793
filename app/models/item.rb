class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # has_one          :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id,
              numericality:      { other_than: 0 }
    validates :sales_status_id,
              numericality:      { other_than: 0 }
    validates :shipping_fee_status_id,
              numericality:      { other_than: 0 }
    validates :prefecture_id,
              numericality:      { other_than: 0 }
    validates :scheduled_delivery_id,
              numericality:      { other_than: 0 }
    validates :price, inclusion: { in: 300..9_999_999 }
  end
end
