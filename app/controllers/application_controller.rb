class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login

    def current_user
      if session[:user_id].present?
        user = User.find_by(:id => session[:user_id])
      end
    end


  
    def require_login
      unless current_user
        redirect_to root_url
      end
    end

    def logged_in?
        !!session[:id]
    end
    
    def authenticate 
        if !logged_in?
          redirect '/login'
        end
    end

    
end
