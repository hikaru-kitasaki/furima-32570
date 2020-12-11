FactoryBot.define do
  factory :item do
    product_name {'test'}
    product_description {'testtest'}
    category_id  {2}
    status_id    {2}
    shipping_charges_id {2}
    shipping_area_id {2}
    days_to_ship_id {2}
    selling_price {30000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
