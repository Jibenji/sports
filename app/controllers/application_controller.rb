class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  attr_reader :current_profile
  helper_method :current_profile

  def current_profile
    current_user.profile
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

end
