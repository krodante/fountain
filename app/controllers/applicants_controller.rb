class ApplicantsController < ApplicationController
  before_action { validate_role('applicant', 'employer') }

  def show
    applicant = Applicant.find_by(user_id: current_user.id)
    @applications = applicant.applications
  end

  def new
    @user_id = current_user.id
  end

  def create
    Applicant.create(applicant_params)
    redirect_to applicant_path(current_user.id)
  end

  private

  def applicant_params
    params.require(:applicant).permit(:user_id, :first_name, :last_name)
  end
end
