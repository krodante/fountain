require 'rails_helper'

RSpec.describe Application, type: :model do
  it "has a valid factory" do
    expect(build(:application)).to be_valid
  end

  let(:application) { build(:application) }
  
  describe "ActiveModel validations" do
    it { expect(application).to validate_presence_of(:applicant_id) }
    it { expect(application).to validate_presence_of(:job_id) }
  end

  describe "ActiveRecord associations" do
    it { expect(application).to belong_to(:job) }
    it { expect(application).to belong_to(:applicant) }
    it { expect(application).to have_db_index([:applicant_id, :job_id]).unique(:true) }
  end
end
