class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @gardens = Garden.all
    @gardens = policy_scope(Garden).order(:name)
  end

  def show
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
    if @garden.save
      redirect_to garden_path(@garden), notice: 'Garden was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @garden.update(garden_params)
    redirect_to garden_path(@garden), notice: 'Garden was successfully updated'
  end

  def destroy
    if @garden.user == current_user || current_user.admin?
      @garden.destroy
      redirect_to gardens_path, notice: 'Garden was successfully destroyed'
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end

  def garden_params
    params.require(:garden).permit(:name, :address, :description, :price_per_day, :user_id)
    @garden.destroy

    redirect_to gardens_path
  end
end
