class UsersController < ApplicationController
  skip_before_action :current_user, only: [:new, :create]

  def profile
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if user.save
      redirect_to user
    else
      redirect_to :new
    end
  end

  private

  def user_params
    params.require(user).permit(:username, :password, :password_confirmation)
  end
end
