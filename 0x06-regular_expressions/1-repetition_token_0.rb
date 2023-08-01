#!/usr/bin/env ruby
# this script matches repetition from 2 to 5

puts ARGV[0].scan(/hbt{2,5}n/).join
