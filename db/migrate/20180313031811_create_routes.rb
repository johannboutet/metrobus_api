class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes, id: false do |t|
      t.string :id, index: { unique: true }, null: false
      t.string :agency_id
      t.string :route_short_name
      t.string :route_long_name
      t.text :route_desc
      t.integer :route_type, null: false
      t.string :route_url
      t.string :route_color
      t.string :route_text_color

      t.timestamps
    end
  end
end
