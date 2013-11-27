class FeedbacksController < ApplicationController
	def new
		@serviceID=params[:service][:id]
		@service=Service.find(@serviceID)
		@fb=Feedback.find_by(:user_id => current_user.id, :service_id => @serviceID)
		@fbrating=@fb.rating if !@fb.nil?
		@fbreview=@fb.review if !@fb.nil?
	end

	def create

		oldfb=Feedback.find_by(:user_id => params[:feedback][:user_id], :service_id=> params[:feedback][:service_id])
		oldfb.destroy if !oldfb.nil?
		@fb=Feedback.new(create_feedback_params)
		if @fb.save
			cnt=0
			vendor=Service.find(params[:feedback][:service_id]).user
			vendor.services.each{|s| cnt+=s.feedbacks.count}
			newrating=vendor.rating*cnt+@fb.rating
			newrating=newrating/(cnt+1)
			vendor.update_attributes(:rating => newrating.round_point5)

			redirect_to '/'
		end

	end



	private

	def new_view_params
	 params.require(:service).permit(:id)
  end
  def create_feedback_params
  	params.require(:feedback).permit(:service_id,:user_id,:rating,:review)
  end

end
