class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :total_time
      t.integer :total_calories

      t.timestamps
    end
  end
end
