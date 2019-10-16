class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :muscle_group
      t.integer :calories_burned
      t.integer :time

      t.timestamps
    end
  end
end
