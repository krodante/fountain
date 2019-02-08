class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @jobs = Job.all
    @employer = current_user.employer
    @applicant = current_user.applicant
  end

  def apply
    user = User.find(params[:user_id])

    Application.create(applicant_id: user.applicant.id, job_id: params[:job_id])
    redirect_to applicant_path(user.id)
  end

  def new
    @employer = Employer.find(params[:employer_id])
    @job = Job.new(employer_id: @employer.id)
  end

  def create
    employer = Employer.find(params[:employer_id].to_i)
    
    job = Job.create(
      title: job_params[:title],
      description: job_params[:description],
      employer_id: employer.id
    )

    redirect_to employer_path(employer.user.id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :employer_id)
  end
end
