require 'rails_helper'

RSpec.describe(ApplicantsController, type: :controller) do
  describe 'GET #show' do
    context 'for an applicant user' do
      let(:applicant) { create(:applicant) }
      let(:user) { User.find(applicant.user_id) }
      before { sign_in_as user }

      it 'shows the appropriate platform' do
        expect(controller.after_sign_in_path_for(user)).to eq(applicant_path(applicant.id))
      end

      context 'applicant has not submitted any applications' do
        it 'does not show the applications table' do
          get :show, params: { id: user.id }

          expect(response.body).to match(/You haven't submitted any applications./)
        end
      end

      context 'applicant has submitted applications' do
        it 'shows the applications table' do
          application = create(:application, applicant: applicant)

          get :show, params: { id: user.id }

          expect(response.body).to include(application.job.title)
        end
      end
    end

    context 'for an employer user' do
      let(:employer) { create(:employer) }
      let(:employer_user) { User.find(employer.user_id) }
      before { sign_in_as employer_user }

      it 'redirects and shows an error' do
        get :show, params: { id: employer_user.id }

        expect(flash[:notice]).to include('You do not have access to the applicant portal.')
        expect(response).to redirect_to(employer_path)
      end
    end
  end
end
