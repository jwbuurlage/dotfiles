#!/usr/bin/ruby

device = ARGV[0]
index = -1

output = `pacmd list-sinks | grep #{device} | grep card`
index = output[/\d+/]

system "pacmd set-default-sink #{index}"

output = `pacmd list-sink-inputs | grep index`
output.each_line do |line|
    system "pacmd move-sink-input #{line[/\d+/]} #{index}"
end
