class Routine < ApplicationRecord
    belongs_to :user
    belongs_to :workout
    def workout_name=(workout)
        self.workout = Workout.find_or_create_by(name: workout)
    end
    
    def workout_name
        self.workout.name if self.workout
    end

    def workout_cals=(workout)
        self.workout = Workout.find_or_create_by(name: workout)
    end
    
    def workout_cals
        self.workout.calories_burned if self.workout
    end
    
    
end
