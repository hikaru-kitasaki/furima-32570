FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefectures_id { 1 }
    municipally { 'あ市' }
    address { 'あ' }
    building_name { 'あ-101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }    
  end
end
