class ReviewsController < ApplicationController
  def index
    @review = Review.where(review_params)
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)

    @garden = Garden.find(params[:garden_id])
    @review.garden_id = @garden.id
    authorize @review
    if @review.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
