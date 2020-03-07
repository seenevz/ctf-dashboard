class UsersController < ApplicationController
  skip_before_action :validate_user, only: [:new, :create]

  def profile
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_profile_path @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
