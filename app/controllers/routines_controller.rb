class RoutinesController < ApplicationController
    def index
        if params[:user_id]
            #@user = User.find(params[:user_id])
            @routines = current_user.routines
        else
            redirect_to root_url
        end
    end

    def new
        @user = User.find(params[:user_id])
        @routine = @user.routines.new
        
    end

    def create
        @user = User.find(params[:user_id])
        @routine = @user.routines.new(routine_params)
        @routine.user = User.find_by(id: params[:user_id])
        if @routine.save
            redirect_to user_routines_path(@user)
        else
          render :new
        end
    end

    def show
        @routine = Routine.find(id: params[:id])
    end


      private

  def routine_params
    params.require(:routine).permit(:title, :date, :workout_id)
  end

end
