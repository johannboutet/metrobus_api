# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

route = Route.create!(
  id: 'route-42',
  route_short_name: '42',
  route_type: 3
)

trip = Trip.create!(
  id: 'trip-42-1',
  route: route,
  service_id: '7days'
)

stop = Stop.create!(
  id: 'stop-park',
  name: 'Park Ave',
  latitude: -41.097448,
  longitude: 70.487647
)

StopTime.create!(
  trip: trip,
  stop: stop,
  arrival_time: '08:00:00',
  departure_time: '08:02:30',
  stop_sequence: 42
)
