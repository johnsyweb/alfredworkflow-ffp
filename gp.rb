#!/usr/bin/ruby
# frozen_string_literal: true

require 'json'

CHROME_DIR_NAME = File.join(Dir.home, 'Library', 'Application Support', 'Google', 'Chrome')
STATE_FILE_NAME = File.join(CHROME_DIR_NAME, 'Local State')
STATE = JSON.parse(File.read(STATE_FILE_NAME))
PROFILES = STATE['profile']['info_cache']
XML_HEAD = %(<?xml version="1.0"?>\n<items>\n")

XML_ITEMS = PROFILES.map do |key, details|
  %(
    <item uid="#{key}" arg="#{key}">
        <title>#{details['name']}</title>
        <subtitle>Launch Google Chrome with using #{key} settings</subtitle>
    </item>
    )
end.join

XML_TAIL = '</items>'

puts [XML_HEAD, XML_ITEMS, XML_TAIL].join
