class ScheduledDelivery < ActiveHash::Base
 self.data = [
   { id: 0, name: '--' },
   { id: 1, name: '今すぐ' },
   { id: 2, name: '今日' },
   { id: 3, name: '明日' }
 ]

  include ActiveHash::Associations
  has_many :items
 end
