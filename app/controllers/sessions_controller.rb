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
      flash[:message] = "Your credentials are invalid, please try again."
      redirect_to '/login'
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

  def omniauth
    user = User.find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider']) do |u|
      u.username = auth_hash['info']['first_name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.hex(12)
    end
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = user.errors.full_messages.join(", ")
      render 'home'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
