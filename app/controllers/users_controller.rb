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

  def new_message
  
  end
  
  def transit
    rec=User.find_by_username(new_msg_params[:recipient])
    body=new_msg_params[:body]
    subject=new_msg_params[:subject]
    if rec.nil? || body.nil? || subject.nil?
      @errs=[]
      if rec.nil?
        @errs << "Recipient can't be empty or is incorrect"
      end
      if body.nil?
        @errs << "Body can't be empty"
      end
      if subject.nil?
        @errs << "Subject can't be empty"
      end
      flash[:danger]="Message couldn't be sent <ul>"+@errs.map{|e| "<li>"+e+"</li>"}.inject{|u,v| u+=v}+"</ul>"
      redirect_to '/new_message'
    else
      flash[:success]="Message sent successfully"
      current_user.send_message(rec,body,subject)
      redirect_to '/new_message'
    end
  end

  def messages
    @usermsgs=current_user.mailbox.inbox.map{|c| c.messages.to_a}.flatten
    @usersent=current_user.mailbox.sentbox.map{|c| c.messages.to_a}.flatten
    @userinbox=@usermsgs.reject{|m| m.sender == current_user}.map{|m| {"sender_id" =>  User.find(m.sender_id).username, "body" => m.body, "date" => m.created_at.to_datetime, "recipient" => m.recipients.first.username, "subject" => m.subject } }
    @useroutbox=@usersent.reject{|m| m.sender != current_user}
    @useroutboxx=@usersent.reject{|m| m.sender != current_user}.map{|m| {"sender_id" =>  User.find(m.sender_id).username, "body" => m.body, "date" => m.created_at.to_datetime, "recipient" => m.recipients.first.username, "subject" => m.subject } }
    
    @userinboxjson=@userinbox.to_json
    @useroutboxjson = @useroutboxx.to_json
  end

  private

  def user_params
    params.require(:user).permit(:username, :emailID, :password, :latitude, :longitude, :dateOfBirth, :realName)
  end

  def new_msg_params
    params.require(:msg).permit(:body,:subject,:recipient)
  end

end
