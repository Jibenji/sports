class RequestsController < ApplicationController
  before_action :load_request, only: [:show, :edit, :destroy]


  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.profile = current_user.profile
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @requests = Request.all
  end

  def show
  end

  def destroy
    @request.destroy
  end

  def edit
  end

  def update
    @request.update_attributes(request_params)
    if @request.valid?
      @request.save
      redirect_to requests_path
    else
      render :edit
    end
  end

  private

  def request_params
    params.require(:request).permit(:certificates, :education, :bio, :banner_picture, :banner_picture_cache, :description)
  end

  def load_request
    @request = Request.find(params[:id])
  end
end
