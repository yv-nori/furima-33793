FactoryBot.define do
  factory :item do
    transient do
      person { Gimei.name }
    end
    image                  { Faker::Lorem.sentence }
    name                   { Faker::Lorem.word }
    info                   { Faker::Lorem.sentence }
    category_id            { 1 }
    sales_status_id        { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id          { 1 }
    scheduled_delivery_id  { 1 }
    price                  { Faker::Number.between(300, 9_999_999) }
    association :sale_user, factory: :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end
  end
  factory :itemImageCleared, parent: :item do
    after(:build) do |item|
      item.image = nil
    end
  end
end
