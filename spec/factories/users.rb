FactoryBot.define do
  factory :user do
    nick_name { Faker::Internet.username }
    last_name         { '山田' }
    first_name        { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    email { Faker::Internet.email }
    password { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    birth_date { Faker::Date.between(from: Date.new(1930, 1, 1), to: Date.new(2020, 12, 31)) }
  end
end
