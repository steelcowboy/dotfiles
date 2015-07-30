#! /usr/bin/env python2

import operator
import mpd 

client = mpd.MPDClient()
client.connect("localhost", 6600) 
curtitle = client.currentsong()['title']

playlist = client.playlistinfo()
pos = None
total = len(playlist)

for i, song in enumerate(playlist):
    if song['title'] == curtitle:
        pos = i
        break
if pos is not None:
    #print map(operator.itemgetter('title'), playlist[pos+1:pos+6])
    for x in range(1,6):
        title = operator.itemgetter('title')(playlist[pos+x])
        title = (data[:38] + '..') if len(title) > 39 else title
        print "%i/%i " % (pos+x+1, total) + title

        
