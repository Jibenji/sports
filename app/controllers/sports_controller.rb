class SportsController < ApplicationController

  before_action :load_sport, only: [:show, :edit, :update, :destroy]

  def index
    @sports = Sport.all
  end

  def show
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @sport.destroy
    redirect_to root_path
  end

  private
  def load_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name, :description, :tagline, :banner_sport_picture, :banner_sport_picture_cache)
  end
end


