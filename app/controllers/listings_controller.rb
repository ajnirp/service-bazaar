class ListingsController < ApplicationController
  def new
  end

  def create
  end

  private

  def new_listing_params
    params.require(:lst).permit(:serviceid)
  end

  def create_listing_params
    params.require(:listing).permit(:startingTime, :endingTime, :minPrice, :maxPrice, :startDate, :endDate, 
      :latitude, :longitude,  :description, :availability, :distance, :service_id)
  end
end
