FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Company.bs }
    
    after(:build) { |job| job.employer = create(:employer) }
  end
end