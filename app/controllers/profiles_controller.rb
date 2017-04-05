class ProfilesController < ApplicationController
  before_action :load_profile, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
    @trainings = current_profile.trainings
  end

  def update
    @profile.update_attributes(profile_params)
    if @profile.valid?
      @profile.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :address, :city, :zip_code, :country, :birth_date, :photo_avatar, :photo_avatar_cache )
  end

  def load_profile
    @profile = current_profile
  end
end
