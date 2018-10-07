FactoryBot.define do
  factory :category do
    sequence(:name)   { |n| "morning routine#{n}" }
  end
end
