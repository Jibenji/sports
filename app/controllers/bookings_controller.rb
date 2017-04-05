class BookingsController < ApplicationController
  before_action :load_booking, only: [:show, :edit, :update, :destroy]
  before_action :load_training, only: [:create, :new, :check_available_space_before_booking]

  def index
    @bookings = current_profile.bookings
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.profile = current_profile
    @booking.training = @training
    if @booking.save
      redirect_to edit_profile_path
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
    @training = Training.find(params[:training_id])
  end

  def booking_params
    params.require(:booking).permit(:participants)
  end
end
