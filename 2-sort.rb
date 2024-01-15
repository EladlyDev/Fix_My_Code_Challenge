#!/usr/bin/env ruby
###
#
#  Sort integer arguments (ascending)
#
###

result = []
ARGV.each do |arg|
  # 12 41 2 C 9 -9 31 fun -1 32
    # skip if not integer
    next if arg !~ /^-?[0-9]+$/

    # convert to integer
    i_arg = arg.to_i

    # insert result at the right position
    is_inserted = false
    i = 0
    l = result.size
    while !is_inserted && i < l do
        if result[i] < i_arg
            i += 1
        else
            tmp = result[i]
            result[i] = i_arg
            i_arg = tmp
            i += 1
        end
    end
    result << i_arg if !is_inserted
end

puts result
