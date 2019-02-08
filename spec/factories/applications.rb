FactoryBot.define do
  factory :application do
    job { create(:job) }
    applicant { create(:applicant) }
  end
end