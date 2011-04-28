class ApplicationController < ActionController::Base

  before_filter :authenticate_user!
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  private

  def require_admin
    unless current_user.admin
      store_location
      flash[:error] = "You must be an Administrator to access this page"
      redirect_to root_path
      return false
    end
  end

  def store_location
    session[:return_to] = (request.get? ? request.fullpath : request.referer)
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
end
