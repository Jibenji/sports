class RegistrationsController < Devise::RegistrationsController

  def create
    super do
      Profile.create(user: resource)
    end
  end

  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile)
  end

end
