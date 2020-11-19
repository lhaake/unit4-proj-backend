class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :title
      t.float :time
      t.string :sport
      t.text :description
      t.float :distance
      t.integer :exertion
      t.string :url
      t.boolean :isFavorite

      t.timestamps
    end
  end
end
