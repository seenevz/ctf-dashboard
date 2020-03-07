class AuthController < ApplicationController
  skip_before_action :validate_user, only: [:login, :create_session]
  before_action :is_logged_in?, only: [:login]

  def login
    @user = User.new
  end

  def create_session
    user = User.find_by(username: login_params[:username])
            .try(:authenticate, login_params[:password])

    if user
      session[:current_user_id] = user.id
      redirect_to(user_profile_path)
    else
      flash[:errors] = ["Wrong username/password"]
      redirect_to(:login)
    end
  end

  def destroy_session
    session.delete(:current_user_id)
    @current_user = nil

    redirect_to(root_path)
  end

  private
  
  def login_params
    params.require(:user).permit(:username, :password)
  end

  def is_logged_in?
    current_user && redirect_to(user_profile_path)
  end
end
