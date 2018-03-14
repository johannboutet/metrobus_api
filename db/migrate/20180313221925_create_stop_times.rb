class CreateStopTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :stop_times do |t|
      t.string :stop_id, index: true, null: false
      t.string :trip_id, index: true, null: false
      t.string :arrival_time, null: false
      t.string :departure_time, null: false
      t.integer :stop_sequence, null: false

      t.timestamps
    end

    add_foreign_key :stop_times, :stops
    add_foreign_key :stop_times, :trips
  end
end
