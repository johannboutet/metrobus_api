class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :trip_id, index: { unique: true }, null: false
      t.string :route_id, index: true, null: false
      t.string :service_id, index: true, null: false
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id, index: true
      t.string :block_id
      t.string :shape_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed

      t.timestamps
    end

    add_foreign_key :trips, :routes, primary_key: :route_id
  end
end
