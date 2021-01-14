FactoryBot.define do
  factory :order_address do
    transient do
      address { Gimei.address }
    end
    Faker::Config.locale = :ja
    postal_code   { Faker::Address.postcode }
    prefecture_id { Faker::Address.state_abbr }
    city          { address.city.kanji }
    addresses     { address.town.kanji + Faker::Address.state_abbr }
    building      { Faker::Lorem.word }
    phone_number  { Faker::Base.numerify '###########' }
    token         { Faker::Base.numerify '###' }
  end
end
