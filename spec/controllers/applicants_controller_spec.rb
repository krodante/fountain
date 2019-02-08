require 'rails_helper'

RSpec.describe ApplicantsController, type: :controller do
  render_views

  let(:applicant) { create(:applicant) }
  let(:user) { User.find(applicant.user_id) }

  describe 'GET #show' do
    it 'shows the appropriate platform' do
      expect(controller.after_sign_in_path_for(user)).to eq applicant_path(applicant.id)
    end

    context 'applicant has not submitted any applications' do
      it 'does not show the applications table' do
        get :show, params: { id: applicant.user_id }

        expect(response.body).to match(/You haven't submitted any applications./)
      end
    end

    context 'applicant has submitted applications' do
      it 'shows the applications table' do
        application = create(:application, applicant: applicant)

        get :show, params: { id: applicant.user_id }

        expect(response.body).to include(application.job.title)
      end
    end
  end
end
