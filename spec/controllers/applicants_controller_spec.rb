require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  let(:applicant) { create(:applicant) }

  before do
    5.times do
      applicant.jobs << create(:job)
    end
  end

  describe 'GET show' do
    it 'shows things' do
      get :show, params: { id: applicant.id }
    end
  end
end
