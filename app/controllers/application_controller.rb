class ApplicationController < ActionController::Base

  def landing
    render :landing, layout: false
  end
end
