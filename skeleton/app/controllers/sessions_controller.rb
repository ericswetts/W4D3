class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash.now[:error] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy

  end

end
