class User::GardensController < ApplicationController
  def index
    @gardens = policy_scope(Garden).where(user: current_user)
    @bookings = current_user.bookings
  end
end
