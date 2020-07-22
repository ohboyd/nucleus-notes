FactoryBot.define do
  factory :note do
    user
    title { Faker::Hipster.paragraph_by_chars(characters: 30) }
    content { Faker::Hipster.paragraph }
  end
end
