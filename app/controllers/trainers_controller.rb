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
  end

  def edit
  end

  def update
  end

  def delete
  end
end
