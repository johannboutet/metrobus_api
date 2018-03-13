class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.string :stop_id, index: { unique: true }, null: false
      t.string :name, null: false
      t.string :description
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :stop_url
      t.integer :location_type
      t.integer :wheelchair_boarding

      t.timestamps
    end
  end
end
