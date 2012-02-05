class MovieSearchesController < ApplicationController
  def show
    @movies = MovieSearch.find(params[:id]).movies
  end

  def find_trailers

    @client = YouTubeIt::Client.new(username: YoutubeApiConfig::USERNAME,
                                   password: YoutubeApiConfig::PASSWORD,
                                   dev_key: YoutubeApiConfig::DEV_KEY)

    playlist = create_youtube_playlist

    movies = MovieSearch.find(params[:id]).movies
    movies.each do |movie|
      trailer = search_youtube_for_trailer(movie)
      add_trailer_to_playlist playlist, trailer
    end

    render text: "http://www.youtube.com/p/#{playlist.playlist_id}?fs=1"
  end

  private
  
  def create_youtube_playlist
    @client.add_playlist(title: YoutubeApiConfig::PLAYLIST_TITLE, descriptoin: "")
  end

  def search_youtube_for_trailer movie
    query = "#{movie.name} #{movie.year} trailer"
    results = @client.videos_by(query: query)
    results.videos[0]
  end

  def add_trailer_to_playlist playlist, video
    @client.add_video_to_playlist(playlist.playlist_id, video.video_id)
  end
end