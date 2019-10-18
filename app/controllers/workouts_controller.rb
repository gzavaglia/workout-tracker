class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find_by(id: params[:id])
    end
    
    def new
        @workout = Workout.new
     end
 
     def create
         workout = Workout.create(workout_params)
         if workout.save
             redirect_to workout_path(workout)
         else
             render :new
         end
     end

    private
    def workout_params
        params.require(:workout).permit(:name, :time, :calories_burned)
    end


end
