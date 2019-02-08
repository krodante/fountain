FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Company.bs }
    employer
  end
end