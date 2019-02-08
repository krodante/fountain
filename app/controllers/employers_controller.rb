class EmployersController < ApplicationController
  def show
    @employer = Employer.find_by(user_id: params[:id])
    @jobs = @employer.jobs
    @applications = @employer.applications
  end

  def new
    @user_id = params[:user_id]
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
