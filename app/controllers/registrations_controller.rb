class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    puts resource.role
    if resource.role == 'applicant'
      new_applicant_path(user_id: resource.id)
    elsif resource.role == 'employer'
      new_employer_path(user_id: resource.id)
    else
      root_path
    end
  end
end