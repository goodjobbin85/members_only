class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  def require_sign_in
    if current_user.nil?
      flash[:danger] = "Sorry, please log in first."
      redirect_to login_path
    end
  end
end
