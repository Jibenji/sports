class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def new

  end

  def create
    @request = Request.find(params[:request])
    @trainer = Trainer.new(@request.attributes.except("id", "created_at", "updated_at", "profile_id"))
    if @trainer.save
      current_profile.trainer = @trainer
      current_profile.save
      @request.destroy
      redirect_to trainers_path
    else
      redirect_to requests_path
    end
  end

  def show
    @trainer = current_profile.trainer
  end

  def edit
    @trainer = current_profile.trainer

  end

  def update
    @trainer = current_profile.trainer
    @trainer.update_attributes(trainer_params)
    @trainer.save
    redirect_to trainer_path(current_profile)
  end

  def destroy
  end

  private

  def trainer_params
    params.require(:trainer).permit(:description, :bio, :certificates, :education, :banner_picture, :banner_picture_cache )
  end
end
