class SessionsController < ApplicationController
  before_action :load_training, only: [:new, :create]

  def new
    @session = Session.new
    @sessions = @training.sessions
  end

  def create
    @session = Session.new(session_params)
    @session.training = @training
    @session.group_capacity = @training.group_capacity
    if @session.save
      redirect_to new_training_session_path(@training)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def session_params
    params.require(:session).permit(:date, :time, :duration, :sport)
  end

  def load_training
    @training = Training.find(params[:training_id])
  end

end
