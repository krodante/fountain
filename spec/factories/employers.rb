FactoryBot.define do
  factory :employer do
    name { Faker::Company.name }
    user { create(:user) }
  end
end