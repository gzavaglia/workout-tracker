class AddRepsToRoutines < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :reps, :integer
  end
end
