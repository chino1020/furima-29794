FactoryBot.define do
  factory :sold_out_order do
    postal_code { '123-4577' }
    prefecture_id { 3 }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits: 11) }
    token { Faker::Internet.password }
    
  end
end
