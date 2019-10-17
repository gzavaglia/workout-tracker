class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    def new
       @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :age, :email, :password, :password_confirmation, :weight, :height)
    end
end
