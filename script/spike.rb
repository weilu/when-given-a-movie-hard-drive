client = YouTubeIt::Client.new(:username => "" , 
                               :password => "" , 
                               :dev_key => "")

playlist = client.add_playlist(title: "gigadeeee", descriptoin: "")
playlist_id = playlist.playlist_id

results = client.videos_by(query: "about a boy trailer")
video_id = results.videos[0].video_id

client.add_video_to_playlist(playlist_id, video_id)