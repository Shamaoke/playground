class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.date :showtime_date
      t.time :showtime_time

      t.timestamps
    end
  end
end
