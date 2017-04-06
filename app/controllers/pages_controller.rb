class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sports = Sport.all
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
end
