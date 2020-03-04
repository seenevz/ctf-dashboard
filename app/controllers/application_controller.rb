class ApplicationController < ActionController::Base
  before_action :current_user
  skip_before_action :current_user, only: [:landing]

  def landing
    render :landing, layout: false
  end

  private

  def current_user
    if @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
      byebug
      @current_user
    else
      redirect_to root_path
    end
  end
end
