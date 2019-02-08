class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def validate_role(role, redirect_resource)
    return if current_user.role == role

    if current_user.role == redirect_resource
      flash[:notice] = "You do not have access to the #{role} portal."
      redirect_to send("#{redirect_resource}_path".to_sym, current_user.id)
    else
      redirect_to root_path
    end
  end

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
