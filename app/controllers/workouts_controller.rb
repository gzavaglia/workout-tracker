class WorkoutsController < ApplicationController
    before_action :require_login
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
         @workout = Workout.create(workout_params)
         if @workout.save
            flash[:success] = "New workout was created!"
            redirect_to workout_path(@workout)
         else
            flash[:danger] = "This workout could not be added"
            redirect_to new_workout_path
         end
     end

     def search
        @workouts = Workout.search(params[:query])
        render :index
     end


    private
    def workout_params
        params.require(:workout).permit(:name, :time, :calories_burned, :muscle_group)
    end


end
