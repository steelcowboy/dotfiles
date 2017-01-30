import mpd

PLAYLIST = 'ThumbsUp'

client = mpd.MPDClient()
client.connect('localhost', 6600)

uri = client.currentsong()['file']
client.playlistadd(PLAYLIST, uri)

