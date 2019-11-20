class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
    @booking.garden = @garden
    authorize @booking
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.garden = @garden
    authorize @booking
    if @booking.save
      redirect_to garden_booking_path(@garden, @booking), notice: 'Booking successfully created'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :garden_id)
  end
end
