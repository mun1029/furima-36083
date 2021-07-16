FactoryBot.define do
  factory :order_sipping do
    post_code { '123-4567' }
    area_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08012341234' }
    token   { 'tok_hogefuga12345' }
  end
end
