class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @gardens = Garden.all
  end

  def show
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save

      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit
  end

  def update
   @garden.update(garden_params)

   redirect_to garden_path(@garden)
  end

  def destroy
    @garden.destroy

    redirect_to gardens_path
  end

private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :address, :description, :price_per_day)
  end
end
