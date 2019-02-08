require 'rails_helper'

RSpec.describe EmployersController, type: :controller do
  render_views

  let(:user) { create(:user, role: 'employer') }
  let(:employer) { create(:employer, user: user) }
  let(:job) { create(:job, employer: employer) }
  let(:applicant) { create(:applicant) }

  describe 'GET #show' do
    it 'shows the appropriate platform' do
      expect(controller.after_sign_in_path_for(user)).to eq employer_path(employer.id)
    end

    context 'employer has posted any jobs' do
      it 'does not show the jobs table' do
        get :show, params: { id: employer.user_id }

        expect(response.body).to match(/ more jobs!/)
      end
    end

    context 'no applications have been submitted' do
      it 'does not show the applications table' do
        get :show, params: { id: employer.user_id }

        expect(response.body).to match(/You have no pending applications./)
      end
    end

    context 'applications have been submitted' do
      it "shows the applicant's name" do
        application = create(:application, applicant: applicant, job: job)

        get :show, params: { id: job.employer.user_id }

        expect(response.body).to include(application.job.title)
        expect(response.body).to include(application.applicant.first_name)
      end
    end
  end
end
