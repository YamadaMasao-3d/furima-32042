FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    product_name          { 'まさおまさお' }
    product_description   { 'いい仕事していますね' }
    category_id           { 1 }
    product_condition_id  { 1 }
    shipping_charge_id    { 1 }
    shipping_area_id      { 1 }
    days_to_ship_id       { 1 }
    product_price         { 3000 }
    association :user
  end
end
