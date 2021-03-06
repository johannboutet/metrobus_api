# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180313221925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "routes", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "agency_id"
    t.string "route_short_name"
    t.string "route_long_name"
    t.text "route_desc"
    t.integer "route_type", null: false
    t.string "route_url"
    t.string "route_color"
    t.string "route_text_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_routes_on_id", unique: true
  end

  create_table "stop_times", force: :cascade do |t|
    t.string "stop_id", null: false
    t.string "trip_id", null: false
    t.string "arrival_time", null: false
    t.string "departure_time", null: false
    t.integer "stop_sequence", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_stop_times_on_stop_id"
    t.index ["trip_id"], name: "index_stop_times_on_trip_id"
  end

  create_table "stops", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "stop_name", null: false
    t.string "stop_desc"
    t.float "stop_lat", null: false
    t.float "stop_lon", null: false
    t.string "stop_url"
    t.integer "location_type"
    t.integer "wheelchair_boarding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_stops_on_id", unique: true
  end

  create_table "trips", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "route_id", null: false
    t.string "service_id", null: false
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.string "block_id"
    t.string "shape_id"
    t.integer "wheelchair_accessible"
    t.integer "bikes_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direction_id"], name: "index_trips_on_direction_id"
    t.index ["id"], name: "index_trips_on_id", unique: true
    t.index ["route_id"], name: "index_trips_on_route_id"
    t.index ["service_id"], name: "index_trips_on_service_id"
  end

  add_foreign_key "stop_times", "stops"
  add_foreign_key "stop_times", "trips"
  add_foreign_key "trips", "routes"
end
