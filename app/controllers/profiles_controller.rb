class ProfilesController < ApplicationController
  before_action :load_profile, only: [:show]
  before_action :load_current_user_profile, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @bookings = current_user.profile.bookings
  end

  def edit
    @profile
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
    params.require(:profile).permit(:first_name, :last_name)
  end

  def load_profile
    @profile = Profile.find(params[:id])
  end

  def load_current_user_profile
    @profile = current_user.profile
  end
end
