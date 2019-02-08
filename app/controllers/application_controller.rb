class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'applicant'
      applicant_path(resource.id)
    elsif resource.role == 'employer'
      employer_path(resource.id)
    else
      root_path
    end
  end
end
