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

    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.save
          flash[:message] = "Your information has been updated"
          redirect_to user_path(@user)
        else
          render :edit
        end
      end

      def google_login
        @user = User.find_by(email: auth[:info][:email])
    
        if @user.nil?
          @user = User.new(
            email: auth[:info][:email],
            username: auth[:info][:name],
            password: SecureRandom.urlsafe_base64
          )
        end
    
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
      end

    
    private
    def user_params
        params.require(:user).permit(:name, :age, :email, :password, :password_confirmation, :weight, :height)
    end

    def auth
        request.env['omniauth.auth']
    end
end
