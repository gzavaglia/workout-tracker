class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          flash[:alert] = "Wrong Password. Please try again"
          render :new
        end
    end

    def destroy
        if current_user
            session.delete :user_id
            redirect_to root_url
        end
    end
end
