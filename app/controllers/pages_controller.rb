class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized

  def home
    @gardens = policy_scope(Garden).order(:name)
    # @gardens = Garden.geocoded

    # @markers = @gardens.map do |garden|
    #   {
    #     lat: garden.latitude,
    #     lng: garden.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { garden: garden })
    #     # image_url: helpers.asset_url('https://cdn.mos.cms.futurecdn.net/05ea615f11e300b074e248aa7378ff64.jpg')
    #   }
    # end
    # @gardens = policy_scope(Garden).order(:name)
    if params[:query].present?
      condition = "address @@ :query OR name @@ :query"
      @gardens = policy_scope(Garden).where(condition, query: "%#{params[:query]}%")
    else
      @gardens = policy_scope(Garden).order(:name)
    end
    # @gardens = Garden.search_by_address_and_name(params[:query])
  end
end
