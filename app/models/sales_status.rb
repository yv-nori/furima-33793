class SalesStatus < ActiveHash::Base
 self.data = [
   { id: 0, name: '--' },
   { id: 1, name: '新品' },
   { id: 2, name: '中古' },
   { id: 3, name: 'ごみ' }
 ]

  include ActiveHash::Associations
  has_many :items
 end
