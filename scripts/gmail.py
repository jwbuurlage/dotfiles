#! /usr/bin/env python

import urllib.request
import time
from xml.etree import ElementTree as etree
from subprocess import call

f = open('/home/jw/Code/scripts/gmail_status', 'w')
f.write('?')
f.close

while True:
    # Enter your username and password below within quotes below, in place of ****.
    # Set up authentication for gmail
    auth_handler = urllib.request.HTTPBasicAuthHandler()
    auth_handler.add_password(realm='New mail feed',
                              uri='https://mail.google.com/',
                              user= '********',
                              passwd= '********')
    opener = urllib.request.build_opener(auth_handler)
    # ...and install it globally so it can be used with urlopen.
    urllib.request.install_opener(opener)

    gmail = 'https://mail.google.com/gmail/feed/atom'
    NS = '{http://purl.org/atom/ns#}'
    with urllib.request.urlopen(gmail) as source:
        tree = etree.parse(source)
    fullcount = tree.find(NS + 'fullcount').text

    f = open('/home/jw/Code/scripts/gmail_status', 'w')
    f.write(fullcount)
    f.close
    time.sleep(10)
