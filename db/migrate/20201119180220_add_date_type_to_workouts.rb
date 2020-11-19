class AddDateTypeToWorkouts < ActiveRecord::Migration[6.1]
  def change
    change_column :workouts, :date, :string
  end
end
