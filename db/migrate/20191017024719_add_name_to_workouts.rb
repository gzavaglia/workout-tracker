class AddNameToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :name, :string
  end
end
