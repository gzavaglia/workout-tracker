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

    def fb_create
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.urlsafe_base64

        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        if current_user
            session.delete :user_id
            redirect_to root_url
        end
    end
    private
 
    def auth
      request.env['omniauth.auth']
    end
    
end
