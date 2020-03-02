class AuthController < ApplicationController
  def login
  end

  def create_session
    if user = User.authenticate(login_params)
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Wrong username/password"
      render :login
    end
  end

  def destroy_session
  end

  private
  
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
