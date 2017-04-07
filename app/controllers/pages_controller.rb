class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :trainings, :results ]
  before_action :load_sports, only: [:home, :results]

  def home
    @trainings = []
    @sports.each do |sport|
      @trainings << sport.trainings.sample
    end
  end

  def trainings
    @trainings = Training.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@trainings) do |training, marker|
      marker.lat training.latitude
      marker.lng training.longitude
    end
  end

  def results
    @sport = Sport.find(params[:search_query][:sport])
    @search = {
      sport_id: @sport,
      date: params[:search_query][:date],
    }

    @search[:level] = params[:search_query][:level] if params[:search_query][:level].present?
    @search[:time] = params[:search_query][:time] if params[:search_query][:time].present?

    @trainings = Training.where(@search)
  end

  private

  def load_sports
    @sports = Sport.all
  end

end
