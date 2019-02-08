class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if resource.role == 'applicant'
      new_applicant_path
    elsif resource.role == 'employer'
      new_employer_path
    else
      root_path
    end
  end
end
