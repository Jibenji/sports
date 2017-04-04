class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new

  end

  def create
    @request = Request.find(params[:request])
    @trainer = Trainer.new(bio: @request.bio)
    @trainer.save
    redirect_to trainers_path
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
