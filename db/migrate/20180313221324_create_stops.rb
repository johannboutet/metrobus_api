class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops, id: false do |t|
      t.string :id, index: { unique: true }, null: false
      t.string :stop_name, null: false
      t.string :stop_desc
      t.float :stop_lat, null: false
      t.float :stop_lon, null: false
      t.string :stop_url
      t.integer :location_type
      t.integer :wheelchair_boarding

      t.timestamps
    end
  end
end
