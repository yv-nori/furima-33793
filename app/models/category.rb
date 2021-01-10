class Category < ActiveHash::Base
 self.data = [
   { id: 0, name: '--' },
   { id: 1, name: 'PC' },
   { id: 2, name: '本' },
   { id: 3, name: '食品' },
 ]

  include ActiveHash::Associations
  has_many :items
 end
