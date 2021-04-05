FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    info              { Faker::Lorem.sentence }
    category_id       { 11 }
    status_id         { 2 }
    fee_id            { 3 }
    prefecture_id     { 3 }
    delivery_id       { 2 }
    price             { 9999999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end