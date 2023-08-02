#!/usr/bin/env ruby
# matches a string that starts with h and end with n

puts ARGV[0].scan(/^h[0-9A-Za-z]+n$/).join
