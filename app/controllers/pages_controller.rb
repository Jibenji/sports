class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :trainings, :results ]
  before_action :load_sports, only: [:home, :results]

  def home

  end

  def trainings
  end

  def results
    @sessions = Session.where(date: params[:search_query][:date])
    if params[:search_query][:sport] == "All Sports"
      @sessions
    else
      @sessions = @sessions.select { |session| session.sport == Sport.find_by_name(params[:search_query][:sport]) }
    end

    #reformat the hash so its linked to a sport name

    @sessions = @sessions.group_by { |session| session.training_id }

    #google maps pins
    trainings = []
    @sessions.each do |training, _sessions|
      trainings << Training.find(training)
    end
    @hash = Gmaps4rails.build_markers(trainings) do |training, marker|
      marker.lat training.latitude
      marker.lng training.longitude
    end
    render :results
 end

  private

  def load_sports
    @sports = Sport.first(5)
    @sports_selection = ["All Sports"]
    @sports.each do |sport|
      (@sports_selection << sport.name).flatten!
    end
  end

end
