class ApplicationController < ActionController::Base
  before_action :set_user, :validate_user
  skip_before_action :validate_user, only: [:landing]

  def landing
    if @current_user
      ## Needs to be changed to redirect to home page (non-existent)
      redirect_to profile_info_path(@current_user.username)
    else
      render(:landing, layout: "non_authorised")
    end
  end

  private

  def set_user
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def validate_user
    @current_user || redirect_to(root_path)
  end

  def is_logged_in?
    current_user && redirect_to(profile_info_path(current_user.username))
  end
end
