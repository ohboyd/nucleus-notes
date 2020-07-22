FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: 'example') }
    password { 'Password1!' }
  end
end
