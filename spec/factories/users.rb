FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { 'aaa@gmail.com' }
    password              { '0000aaaa' }
    password_confirmation { '0000aaaa' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
