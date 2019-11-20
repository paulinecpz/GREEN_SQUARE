class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized

  def home
    @gardens = Garden.all
  end
end
