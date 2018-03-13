# == Schema Information
#
# Table name: stops
#
# *id*::                  <tt>integer, not null, primary key</tt>
# *stop_id*::             <tt>string, not null</tt>
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
#  index_stops_on_stop_id  (stop_id) UNIQUE
#--
# == Schema Information End
#++

class Stop < ApplicationRecord
end