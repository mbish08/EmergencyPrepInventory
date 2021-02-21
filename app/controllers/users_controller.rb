class UsersController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end  
    end

    def show
      if current_user.id != params[:id].to_i
        redirect_to current_user
      else
        @user = User.find(params[:id]) if @user
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end
