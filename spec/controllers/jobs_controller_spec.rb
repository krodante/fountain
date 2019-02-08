require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  render_views

  describe 'GET #index' do
    it 'ensures that a user has logged in' do
      get :index

      expect(response).to redirect_to('/users/sign_in')
    end

    context 'when a user is logged in' do
      let(:applicant_user) { create(:user, role: 'applicant') }
      let(:employer_user) { create(:user, role: 'employer') }

      before do
        create(:job)
        create(:employer, user: employer_user)
        create(:applicant, user: applicant_user)
      end

      it 'shows the Apply link for applicants' do
        sign_in(applicant_user)

        get :index

        expect(response.body).to include('href="/apply')
      end

      it 'does not show the Apply link for employers' do
        sign_in(employer_user)

        get :index

        expect(response.body).to include('<td>Apply')
      end
    end
  end

  def sign_in(user)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end
