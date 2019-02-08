class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @jobs = Job.all
    @employer = current_user.employer
    @applicant = current_user.applicant
  end

  def apply
    job = Job.find(params[:job_id])
    Application.create(applicant_id: current_user.applicant.id, job_id: job.id)
    flash[:success] = "You applied to the #{job.title} position!"
    redirect_to applicant_path(current_user.id)
  end

  def new
    @employer = Employer.find(params[:employer_id])
    @job = Job.new(employer_id: @employer.id)
  end

  def create
    Job.create(
      title: job_params[:title],
      description: job_params[:description],
      employer_id: current_user.employer.id
    )

    redirect_to employer_path(current_user.id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :employer_id)
  end
end
