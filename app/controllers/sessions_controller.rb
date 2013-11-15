class SessionsController < ApplicationController
  def create
    user = User.find_by(:username => params[:session][:username].downcase)
    if user && User.authenticate(params[:session][:username], params[:session][:password])
      # sign the user in and redirect to their page
      sign_in(user)
      redirect_to "/"
    else
      # create an error message and redirect to the home page
      flash[:signin_error] = "Error signing in: invalid username/password combination!"
      render 'pages/login'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
