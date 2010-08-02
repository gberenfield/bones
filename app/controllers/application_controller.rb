class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # helper_method :current_user_session, :current_user  # THIS MAKES THESE METHODS AVAILABLE TO ALL CONTROLLERS AS HELPERS!!!!
  # before_filter :require_user
      
  private

  # def current_user_session
  #   return @current_user_session if defined?(@current_user_session)
  #   @current_user_session = UserSession.find
  # end
  # 
  # def current_user
  #   return @current_user if defined?(@current_user)
  #   @current_user = current_user_session && current_user_session.user
  # end
  # 
  # def user_admin
  #   current_user
  #   return @current_user.admin if defined?(@current_user)
  # end
  # 
  # def user_editor
  #   current_user
  #   return @current_user.editor if defined?(@current_user)
  # end
  # 
  # def require_user
  #   unless current_user
  #     store_location
  #     flash[:error] = "You must be logged in to access this page"
  #     redirect_to login_path
  #     return false
  #   end
  # end
  
  def require_admin
    unless current_user.admin
      store_location
      flash[:error] = "You must be an Administrator to access this page"
      redirect_to root_path
      return false
    end
  end
  # 
  # def require_editor
  #   unless (user_editor || user_admin)
  #     store_location
  #     flash[:error] = "You must be an Editor to access this page"
  #     redirect_to root_path
  #     return false
  #   end
  # end
  # 
  # 
  # def require_no_user
  #   if current_user
  #     store_location
  #     flash[:error] = "You must be logged out to access this page"
  #     redirect_to logout_path
  #     return false
  #   end
  # end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
