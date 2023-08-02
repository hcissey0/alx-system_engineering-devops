#!/usr/bin/env ruby
# matches a 10 digit phone number

puts ARGV[0].scan(/^[0-9][0-9]{8,8}[0-9]$/).join
