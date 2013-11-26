class ServicesController < ApplicationController
  def new
  end

  def create
    @service = current_user.services.build(create_service_params)
    @category = Category.find @service.category_id
    if @service.save
      @category.services.push @service
      flash[:service_created] = "Service successfully created"
      redirect_to '/'
    end
  end

  def show
    serv_id = request.original_url.split("/").last
    @service = Service.find(serv_id)
  end

  private

  def create_service_params
    params.require(:service).permit(:title, :description, :visibility, :category_id)
  end
end
