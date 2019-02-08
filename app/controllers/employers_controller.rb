class EmployersController < ApplicationController
  before_action { validate_role('employer', 'applicant') }

  def show
    @employer = Employer.find_by(user_id: current_user.id)
    @jobs = @employer.jobs
    @applications = @employer.applications
  end

  def new
    @user_id = current_user.id
  end

  def create
    Employer.create(employer_params)
    redirect_to employer_path(employer_params[:user_id])
  end

  private

  def employer_params
    params.require(:employer).permit(:user_id, :name)
  end
end
