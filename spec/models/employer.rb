require 'rails_helper'

RSpec.describe(Employer, type: :model) do
  it "has a valid factory" do
    expect(build(:employer)).to be_valid
  end

  let(:employer) { build(:employer) }

  describe "ActiveModel validations" do
    it { expect(employer).to validate_presence_of(:name) }
    it { expect(employer).to validate_presence_of(:user_id) }
  end

  describe "ActiveRecord associations" do
    it { expect(employer).to belong_to(:user) }
    it { expect(employer).to have_many(:jobs) }
    it { expect(employer).to have_many(:applications).through(:jobs) }
    it { expect(employer).to have_db_index(:user_id).unique(:true) }
  end
end
