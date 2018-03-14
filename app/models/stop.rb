# == Schema Information
#
# Table name: stops
#
# *id*::                  <tt>string, not null</tt>
# *name*::                <tt>string, not null</tt>
# *description*::         <tt>string</tt>
# *latitude*::            <tt>float, not null</tt>
# *longitude*::           <tt>float, not null</tt>
# *stop_url*::            <tt>string</tt>
# *location_type*::       <tt>integer</tt>
# *wheelchair_boarding*:: <tt>integer</tt>
# *created_at*::          <tt>datetime, not null</tt>
# *updated_at*::          <tt>datetime, not null</tt>
#
# Indexes
#
#  index_stops_on_id  (id) UNIQUE
#--
# == Schema Information End
#++

class Stop < ApplicationRecord
  self.primary_key = :id

  has_many :stop_times, dependent: :destroy, inverse_of: :stop
  has_many :trips, through: :stop_times, inverse_of: :stops

  with_options presence: true do
    validates :id, uniqueness: true
    validates :name, :latitude, :longitude
  end
end
