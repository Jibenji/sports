class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      user.create_profile
      user.send_welcome_email
    end
  end

  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile)
  end
end
