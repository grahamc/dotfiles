#!/usr/bin/env python

import mechanize
from appscript import app, mactypes, its
from datetime import date

d = date.today()
br = mechanize.Browser()

datestring = d.strftime("%y%m%d")

image_src = 'http://apod.nasa.gov/apod/ap%s.html' % datestring
image_target = '/Users/gchristensen/.apod/img-%s' % datestring

br.open(image_src)
for link in br.links():
    if link.url.startswith('image/'):
        resp = br.follow_link(link)
        with open(image_target, 'w') as fo:
            fo.write(resp.read())
        break

se = app('System Events')
desktops = se.desktops.display_name.get()

for d in desktops:
    desk = se.desktops[its.display_name == d]
    desk.picture.set(mactypes.File(image_target))

