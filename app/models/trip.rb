# == Schema Information
#
# Table name: trips
#
# *id*::                    <tt>string, not null</tt>
# *route_id*::              <tt>string, not null</tt>
# *service_id*::            <tt>string, not null</tt>
# *trip_headsign*::         <tt>string</tt>
# *trip_short_name*::       <tt>string</tt>
# *direction_id*::          <tt>integer</tt>
# *block_id*::              <tt>string</tt>
# *shape_id*::              <tt>string</tt>
# *wheelchair_accessible*:: <tt>integer</tt>
# *bikes_allowed*::         <tt>integer</tt>
# *created_at*::            <tt>datetime, not null</tt>
# *updated_at*::            <tt>datetime, not null</tt>
#
# Indexes
#
#  index_trips_on_direction_id  (direction_id)
#  index_trips_on_id            (id) UNIQUE
#  index_trips_on_route_id      (route_id)
#  index_trips_on_service_id    (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (route_id => routes.id)
#--
# == Schema Information End
#++

class Trip < ApplicationRecord
  self.primary_key = :id

  belongs_to :route, inverse_of: :trips

  has_many :stop_times, dependent: :destroy, inverse_of: :trip
  has_many :stops, through: :stop_times, inverse_of: :trips

  with_options presence: true do
    validates :id, uniqueness: true
    validates :route_id, :service_id
  end
end
