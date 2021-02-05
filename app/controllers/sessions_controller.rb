class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
    else
      flash.alert = "Your credentials are invalid, please try again."
      redirect_to '/login'
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

end
