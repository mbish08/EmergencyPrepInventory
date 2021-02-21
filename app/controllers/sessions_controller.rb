class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create, :home]

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
    user = User.create_from_omniauth(auth_hash)
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
