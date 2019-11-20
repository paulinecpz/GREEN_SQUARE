class User::GardensController < ApplicationController

  def index
    @gardens = policy_scope(Garden).where(user: current_user)
  end
end
