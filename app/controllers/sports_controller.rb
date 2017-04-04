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
    @sport.save
    redirect_to sport_path(@sport)
  end

  def edit
  end


  def destroy
    @sport.destroy
    redirect_to root_path
  end

end


private

def load_sport
  @sport = Sport.find(params[:id])
end

def sport_params
    params.require(:sport).permit(:name, :description, :tagline, :banner_sport_picture, :banner_sport_picture_cache)
  end
