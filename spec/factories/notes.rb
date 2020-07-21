FactoryBot.define do
  factory :note do
    title { Faker::Hipster.paragraph_by_chars(characters: 30) }
    content { Faker::Hipster.paragraph }
  end
end
