class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :trainings, :results ]
  before_action :load_sports, only: [:home, :results]

  def home

  end

  def trainings
  end

  def results
    @sessions = Session.where(date: params[:search_query][:date])

    #number of guests filter
    if params[:search_query][:participants]
      @sessions = @sessions.select { |session| session.available_spots >= params[:search_query][:participants].to_i }
    else
      @sessions
    end

    if params[:search_query][:sport] == "All Sports"
      @sessions = @sessions
    else
      @sessions = @sessions.select { |session| session.sport == Sport.find_by_name(params[:search_query][:sport]) }
    end

    @sessions = @sessions.group_by { |session| session.training_id }

    #google maps pins
    @trainings_id = []
    @sessions.each do |k,v|
      @trainings_id << k
    end
    @trainings = []
    @trainings_id.each do |training_id|
      @trainings << Training.find(training_id)
    end

    @hash = Gmaps4rails.build_markers(@trainings) do |training, marker|
      marker.lat training.latitude
      marker.lng training.longitude
      marker.json({ :id => training.id })
    end

    if @hash.empty?
      @hash.push({
        lat: 52.3776016,
        lng: 4.8985407
      })
    end
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
