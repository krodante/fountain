class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def apply
    user = User.find(params[:user_id])

    if user.employer
      puts 'oops'
      flash[:error] = 'Employers cannot apply for jobs!'
      redirect_to action: 'index'
    else
      Application.create(applicant_id: user.applicant.id, job_id: params[:job_id])
      redirect_to applicant_path(user.id)
    end
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
