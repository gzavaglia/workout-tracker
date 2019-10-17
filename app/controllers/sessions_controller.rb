class SessionsController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.find(:email => params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = "Login is incorrect"
          redirect_to :login
        end
      end

    def destroy
        if current_user
            session.delete :user_id
            redirect_to root_url
        end
    end
end
