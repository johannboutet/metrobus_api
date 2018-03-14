# == Schema Information
#
# Table name: routes
#
# *id*::               <tt>string, not null</tt>
# *agency_id*::        <tt>string</tt>
# *route_short_name*:: <tt>string, default(""), not null</tt>
# *route_long_name*::  <tt>string, default(""), not null</tt>
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

require 'rails_helper'

RSpec.describe Route, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
