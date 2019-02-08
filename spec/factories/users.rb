FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::GameOfThrones.name }

    after(:build) { |u| u.password_confirmation = u.password }
  end
end
