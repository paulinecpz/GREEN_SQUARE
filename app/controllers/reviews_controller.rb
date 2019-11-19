class ReviewsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    @garden = Garden.find(params[:garden_id])
    @review.garden = @garden
    @review.save
    redirect_to garden_path(@garden)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
