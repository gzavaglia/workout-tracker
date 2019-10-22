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
        flash[:danger] = "This Routine Could not be Created :("
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
        @routine = current_user.routines.find(params[:id])
        @user = User.find(params[:user_id])

    end
  
    def update
        @user = User.find(params[:user_id])
        @routine = Routine.find(params[:id])
        @routine.update(routine_params)
 
      if @routine.save
        redirect_to user_routine_path(current_user, @routine)
        flash[:message] = "#{@routine.title} updated!"
      else
        render :edit
      end
    end
  
    def destroy
        @routine = current_user.routines.find(params[:id])
        if @routine
          @routine.destroy
          redirect_to user_routines_path(current_user)
          flash[:message] = "Your routine has been deleted"
        else
          render :show
          flash[:danger] = "This routine could not be deleted"
        end
    end

      private

  def routine_params
    params.require(:routine).permit(:title, :date, :workout_id, :workout_name, :reps, :workout_cals)
  end

  

end
