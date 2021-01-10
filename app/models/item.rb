class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one    :order
  has_one    :address
end
