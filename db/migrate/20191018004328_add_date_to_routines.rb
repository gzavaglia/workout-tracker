class AddDateToRoutines < ActiveRecord::Migration[5.2]
  def change
    add_column :routines, :date, :date
  end
end
