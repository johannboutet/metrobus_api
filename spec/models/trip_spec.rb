# == Schema Information
#
# Table name: trips
#
# *id*::                    <tt>string, not null, primary key</tt>
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

require 'rails_helper'

RSpec.describe Trip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
