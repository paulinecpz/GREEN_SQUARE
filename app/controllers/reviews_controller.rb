class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to garden_path(@garden)
    else
      render 'user/gardens/index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
