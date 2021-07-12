FactoryBot.define do
  factory :product do
    name              {'test'}
    description       {'test'}
    category_id       {2}
    delivery_id       {2}
    area_id           {2}
    delivery_day_id   {2}
    status_id         {2}
    price             {3000}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
