# == Schema Information
#
# Table name: stop_times
#
# *id*::             <tt>integer, not null, primary key</tt>
# *stop_id*::        <tt>string, not null</tt>
# *trip_id*::        <tt>string, not null</tt>
# *arrival_time*::   <tt>string, not null</tt>
# *departure_time*:: <tt>string, not null</tt>
# *stop_sequence*::  <tt>integer, not null</tt>
# *created_at*::     <tt>datetime, not null</tt>
# *updated_at*::     <tt>datetime, not null</tt>
#
# Indexes
#
#  index_stop_times_on_stop_id  (stop_id)
#  index_stop_times_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (stop_id => stops.id)
#  fk_rails_...  (trip_id => trips.id)
#--
# == Schema Information End
#++

class StopTime < ApplicationRecord
  self.primary_key = :id

  belongs_to :stop, inverse_of: :stop_times
  belongs_to :trip, inverse_of: :stop_times

  validates :stop_id, :trip_id, :arrival_time, :departure_time, presence: true
end
