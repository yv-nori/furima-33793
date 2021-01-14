class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  VALID_POSTAL_REGEX = /\A[0-9]{3}-[0-9]{4}\z/

  with_options presence: true do
    validates :postal_code, format:         { with: VALID_POSTAL_REGEX }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :phone_number, numericality:  { only_integer: true }, length: { in: 0..11 }
    validates :city
    validates :addresses
    validates :token
    validates :item_id
    validates :user_id
  end

  def item
    Item.find(item_id)
  end

  def save
    user = User.find(user_id)
    item = Item.find(item_id)
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
                   city: city, building: building, phone_number: phone_number,
                   addresses: addresses, order_id: order.id)
  end
end
