require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }
  
  describe "ActiveModel validations" do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:password) }

    it { expect(user).to validate_inclusion_of(:role).in_array(['applicant', 'employer']) }
  end

  describe "ActiveRecord associations" do
    it { expect(user).to have_one(:employer) }
    it { expect(user).to have_one(:applicant) }
    it { expect(user).to have_db_index(:email).unique(true) }
  end
end
