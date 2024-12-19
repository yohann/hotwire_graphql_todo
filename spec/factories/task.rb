FactoryBot.define do
  factory :task do
    name { Faker::Verb.base + " " + Faker::Food.ingredient }
    description { Faker::Food.description }
    state_cd { "in_progress" }
  end
end
