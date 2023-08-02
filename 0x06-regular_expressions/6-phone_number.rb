#!/usr/bin/env ruby
# matches a 10 digit phone number

puts ARGV[0].scan(/[1-9]\d{9}/).join
