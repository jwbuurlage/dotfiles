#!/usr/bin/ruby

for i in 150..200
    print i
    num = "%03d" % i
    system("echo -n -e '\\uE#{num}'")
    print " "
end
