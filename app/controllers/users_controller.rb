class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to '/'
    else
      flash[:signup_error] = "Error signing up!"
      render '/pages/signup'
    end
  end

  def show
    @user = User.find(request.original_url.split('/').last)
  end

  private

  def user_params
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
  end
end
