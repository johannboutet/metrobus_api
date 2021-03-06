# == Schema Information
#
# Table name: routes
#
# *id*::               <tt>string, not null, primary key</tt>
# *agency_id*::        <tt>string</tt>
# *route_short_name*:: <tt>string</tt>
# *route_long_name*::  <tt>string</tt>
# *route_desc*::       <tt>text</tt>
# *route_type*::       <tt>integer, not null</tt>
# *route_url*::        <tt>string</tt>
# *route_color*::      <tt>string</tt>
# *route_text_color*:: <tt>string</tt>
# *created_at*::       <tt>datetime, not null</tt>
# *updated_at*::       <tt>datetime, not null</tt>
#
# Indexes
#
#  index_routes_on_id  (id) UNIQUE
#--
# == Schema Information End
#++

class Route < ApplicationRecord
  self.primary_key = :id

  has_many :trips, dependent: :destroy, inverse_of: :route
  has_many :stops, through: :trips

  with_options presence: true do
    validates :id, uniqueness: true
    validates :route_type
  end
  validates :route_short_name, presence: true, if: ->(r) { r.route_long_name.blank? }
  validates :route_long_name, presence: true, if: ->(r) { r.route_short_name.blank? }
end
