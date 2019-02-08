class ApplicantsController < ApplicationController
  def show
    applicant = Applicant.find_by(user_id: params[:id])
    @applications = applicant.applications
  end

  def new
    @user_id = params[:user_id]
  end

  def create
    Applicant.create(applicant_params)
    redirect_to applicant_path(applicant_params[:user_id]) 
  end

  private

  def applicant_params
    params.require(:applicant).permit(:user_id, :first_name, :last_name)
  end
end
