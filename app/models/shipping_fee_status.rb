class ShippingFeeStatus < ActiveHash::Base
 self.data = [
   { id: 0, name: '--' },
   { id: 1, name: '手数料：あり' },
   { id: 2, name: '手数料：なし' }
 ]

  include ActiveHash::Associations
  has_many :items
 end
