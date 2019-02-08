require 'rails_helper'

RSpec.describe Job, type: :model do
  it "has a valid factory" do
    expect(build(:job)).to be_valid
  end

  let(:job) { build(:job) }
  
  describe "ActiveModel validations" do
    it { expect(job).to validate_presence_of(:employer_id) }
  end

  describe "ActiveRecord associations" do
    it { expect(job).to belong_to(:employer) }
    it { expect(job).to have_many(:applications) }
    it { expect(job).to have_many(:applicants).through(:applications) }
    it { expect(job).to have_db_index(:employer_id) }
  end
end
