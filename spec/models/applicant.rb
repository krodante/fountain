require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it "has a valid factory" do
    expect(build(:applicant)).to be_valid
  end

  let(:applicant) { build(:applicant) }
  
  describe "ActiveModel validations" do
    it { expect(applicant).to validate_presence_of(:first_name) }
    it { expect(applicant).to validate_presence_of(:last_name) }
    it { expect(applicant).to validate_presence_of(:user_id) }
  end

  describe "ActiveRecord associations" do
    it { expect(applicant).to belong_to(:user) }
    it { expect(applicant).to have_many(:applications) }
    it { expect(applicant).to have_many(:jobs).through(:applications) }
    it { expect(applicant).to have_db_index(:user_id).unique(:true) }
  end
end
