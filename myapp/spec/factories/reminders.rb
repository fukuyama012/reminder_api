FactoryBot.define do
  factory :reminder do
    notify { "MyString" }
    description { "MyText" }
    cycle_days { 1 }
    category { nil }
  end
end
