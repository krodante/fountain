require 'rails_helper'

RSpec.describe(JobsController, type: :controller) do
  let(:applicant_user) { create(:user, role: 'applicant') }
  let(:employer_user) { create(:user, role: 'employer') }

  before do
    create(:job)
    create(:employer, user: employer_user)
    create(:applicant, user: applicant_user)
  end

  describe 'GET #index' do
    it 'ensures that a user has logged in' do
      get :index

      expect(response).to redirect_to('/users/sign_in')
    end

    context 'when a user is logged in' do
      it 'shows the Apply link for applicants' do
        sign_in_as(applicant_user)

        get :index

        expect(response.body).to include('href="/apply')
      end

      it 'does not show the Apply link for employers' do
        sign_in_as(employer_user)

        get :index

        expect(response.body).to include('<td>Apply')
      end
    end
  end

  describe 'POST #apply' do
    it 'creates an application record' do
      new_job = create(:job)
      sign_in_as(applicant_user)

      post :apply, params: { job_id: new_job.id }

      expect(flash[:success]).to include(new_job.title)
    end
  end

  describe 'POST #create' do
    it 'creates a job for a given employer' do
      sign_in_as(employer_user)
      params = {
        employer_id: employer_user.employer.id,
        job: { title: 'Fun Job', description: 'So super fun!' },
      }

      post :create, params: params

      expect(response).to redirect_to(employer_path(employer_user.id))
    end
  end
end
