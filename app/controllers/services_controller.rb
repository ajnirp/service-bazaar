class ServicesController < ApplicationController
  def new
  end

  def create
    @service = current_user.services.build(create_service_params)
    # @category = Category.find_by_name(params[:category])
    if @service.save
      # @category.services.push @service
      flash[:service_created] = "Service successfully created"
      redirect_to '/'
    end
  end

  def show
    serv_id = request.original_url.split("/").last
    @service = Service.find(serv_id)
    @reviews = @service.feedbacks
    @fbl=@reviews.map{|f| {"buyer_info"=>f.user_id.to_s+" "+User.find(f.user_id).username,"rating"=>f.rating,"review"=>f.review}}
    @feedbackjson=@fbl.to_json
  end

  private

  def create_service_params
    params.require(:service).permit(:title, :description, :visibility, :category)
  end
end
