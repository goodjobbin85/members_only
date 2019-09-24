module SessionsHelper
    
    def login_user(user)
        session[:user_id] = user.id
    end
    
    def logout_user
        session[:user_id] = nil
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
end
