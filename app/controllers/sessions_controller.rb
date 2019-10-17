class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:danger] = "Wrong email and/or password"
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
