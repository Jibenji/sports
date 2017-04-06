class TrainingsController < ApplicationController
  before_action :load_training, only: [:show, :edit, :update, :destroy]

  def index
    @trainings = current_profile.trainings
  end

  def show
  end

  def new
    @sports = Sport.all

    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    @training.profile = current_user.profile
    if @training.save
      redirect_to trainings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @training = Training.new(training_params)
    @training.profile = current_user.profile
    if @training.save
      redirect_to trainings_path
    else
      render :edit
    end
  end

  def destroy
    @training.destroy
    redirect_to :back
  end

  private
  def training_params
    params.require(:training).permit(:sport_id, :title, :date, :time, :duration, :price, :group_capacity, :level, :description, :outdoor, :longitude, :lattitude, :country, :city, :address, :zip_code)
  end

  def load_training
    @training = Training.find(params[:id])
  end

end


