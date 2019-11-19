class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      redirect_to new_garden_booking_path(@booking.id), notice: 'Booking successfully created'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :garden_id)
  end
end
