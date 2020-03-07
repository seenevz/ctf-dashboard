class ApplicationController < ActionController::Base
  before_action :validate_user
  skip_before_action :validate_user, only: [:landing]

  def landing
    render(:landing, layout: false)
  end

  private

  def current_user
    @current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def validate_user
    current_user
    @current_user || redirect_to(root_path)
  end
end
