class ReviewsController < ApplicationController
  before_action :load_review, only: [ :edit, :update, :destroy]
  before_action :load_booking, only: [:new, :update]


  def new
    @review = Review.new
  end

  def create
  end

  def destroy
  end


  def create
    @review = Review.new(review_params)
    @review.profile = current_user.profile
    @review.booking = @booking
    if @review.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review = Review.new(review_params)
    @review.profile = current_user.profile
    @review.booking = @booking
    if @review.save
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def load_review
    @review = Review.find(params[:review_id])
  end

  def load_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
