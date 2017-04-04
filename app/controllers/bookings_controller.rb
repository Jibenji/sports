class BookingsController < ApplicationController
  before_action :load_booking, only: [:show, :edit, :update, :destroy]
  before_action :load_training, only: [:create]


  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.profile = current_user.profile
    @booking.training = @training
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end


  def destroy
  end


  private

  def load_booking
    @booking = Booking.find(params[:booking_id])
  end

  def load_training
    @training = Training.find(params[:id])

  def booking_params
    params.require(:booking).permit(:participants)
  end

end
