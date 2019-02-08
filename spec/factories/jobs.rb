FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Company.bs }
    employer { create(:employer) }
  end
end
