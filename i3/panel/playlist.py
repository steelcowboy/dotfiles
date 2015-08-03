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
    
    remain = total - pos
    if remain > 6:
        y = 6
    else:
        y = remain

    for x in range(1,y):
        title = operator.itemgetter('title')(playlist[pos+x])
        title = (title[:26] + '...') if len(title) > 30 else title
        print "%i/%i " % (pos+x+1, total) + title

        
