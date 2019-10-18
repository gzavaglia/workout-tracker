class RoutinesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @routines = @user.routines
        else
            redirect_to root_url
        end
    end

    def new
        @user = User.find(params[:user_id])
        @routine = Routine.new
    end


end
