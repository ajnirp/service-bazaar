class ListingsController < ApplicationController
  def new
  end

  def create
    @service = Service.find(params[:listing][:service_id].to_i)
    @listing = Listing.new(create_listing_params)
    if @listing.save
      redirect_to '/'
    else
      redirect_to "/services/#{@service.id}"
      flash[:error] = "Could not create listing because of the following errors:"
      @listing.errors.full_messages.each { |m| flash[:error] += (m + ", ") }
    end
  end

  def show
    @listing = Listing.find(request.original_url.split('/').last)
    if @listing.nil?
      flash[:error] = "No such listing"
      redirect_to '/'
    else
      @service = @listing.service
    end
  end

  def destroy
    @listing = Listing.find(params[:listingid])
    @listing.destroy
    redirect_to '/'
  end

  private

  def new_listing_params
    params.require(:lst).permit(:serviceid)
  end

  def destory_listing_params
    params.require(:lst).permit(:serviceid, :listingid)
  end

  def create_listing_params
    params.require(:listing).permit(:startingTime, :endingTime, :minPrice, :maxPrice, :startDate, :endDate, 
      :latitude, :longitude,  :description, :availability, :distance, :service_id)
  end
end
