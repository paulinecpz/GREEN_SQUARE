class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @gardens = policy_scope(Garden).order(:name)
    @gardens = Garden.geocoded

    @markers = @gardens.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { garden: garden })
        # image_url: helpers.asset_url('https://cdn.mos.cms.futurecdn.net/05ea615f11e300b074e248aa7378ff64.jpg')
      }
    end
    # @gardens = policy_scope(Garden).order(:name)
    if params[:query].present?
      condition = "address @@ :query OR name @@ :query"
      @gardens = policy_scope(Garden).where(condition, query: "%#{params[:query]}%")
    else
      @gardens = policy_scope(Garden).order(:name)
    end
    # @gardens = Garden.search_by_address_and_name(params[:query])
  end

  def show
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    authorize @garden
    if @garden.save
      redirect_to user_gardens_path, notice: 'Garden was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(@garden), notice: 'Garden was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to user_gardens_path, notice: 'Garden was successfully destroyed'
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end

  def garden_params
    params.require(:garden).permit(:name, :address, :description, :photo, :price_per_day, :user_id)
  end
end
