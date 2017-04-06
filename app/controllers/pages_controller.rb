class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :trainings, :results ]

  def home
    @sports = Sport.all.pluck(:name)
  end

  def trainings
    @trainings = Training.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@trainings) do |training, marker|
      marker.lat training.latitude
      marker.lng training.longitude
    end
  end

  def results
    @sport = Sport.find_by_name(params[:search_query][:sport])
    @trainings = Training.where({ sport_id: @sport, date: params[:search_query][:date] })
  end
end
