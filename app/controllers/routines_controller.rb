class RoutinesController < ApplicationController
    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
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
        @routine = current_user.routines.find(params[:id])
        workouts = current_user.workouts
        workouts.each do |workout|
            if @routine.workout_id == workout.id
                @works = workout
            end
        end
        @works
    end

    def edit
    end
  
    def update
      @watchlist.update(watchlist_params)
      if @watchlist.save
        redirect_to watchlist_path(@watchlist)
        flash[:message] = "#{@watchlist.name} updated!"
      else
        render :edit
      end
    end
  
    

      private

  def routine_params
    params.require(:routine).permit(:title, :date, :workout_id)
  end

  

end
