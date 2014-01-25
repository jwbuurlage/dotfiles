#!/usr/bin/ruby

while true
    output = `fbcmd notify | grep MESSAGE`
    unreadmessages = output[/\d+/]

    f = File.new('/home/jw/Code/scripts/facebook_status', 'w')
    f.write(unreadmessages)
    f.close

    sleep(60)
end

