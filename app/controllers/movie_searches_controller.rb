class MovieSearchesController < ApplicationController
  def show
    @movies = MovieSearch.find(params[:id]).movies.scoped

    @year_before = params[:year_before]
    @year_after = params[:year_after]
    @rating_higher_than = params[:rating_higher_than]
    @rating_lower_than = params[:rating_lower_than]

    @movies = @movies.year_before(@year_before) if @year_before.present?
    @movies = @movies.year_after(@year_after) if @year_after.present?
    @movies = @movies.rating_higher_than(@rating_higher_than) if @rating_higher_than.present?
    @movies = @movies.rating_lower_than(@rating_lower_than) if(@rating_lower_than.present?)
  end

  def find_trailers

    @client = YouTubeIt::Client.new(username: YoutubeApiConfig::USERNAME,
                                   password: YoutubeApiConfig::PASSWORD,
                                   dev_key: YoutubeApiConfig::DEV_KEY)
    playlist = create_youtube_playlist
    @playlist_id = playlist.playlist_id

    movies = JSON.parse params[:movies]
    movies.each do |movie|
      trailer = search_youtube_for_trailer(movie)
      add_trailer_to_playlist playlist, trailer
    end

    render 'play'
  end

  private
  
  def create_youtube_playlist
    playlist_title = "Movies I would potentially watch #{Time.now.to_i}"
    @client.add_playlist(title: playlist_title, descriptoin: "")
  end

  def search_youtube_for_trailer movie
    query = "#{movie['name']} #{movie['year']} trailer"
    results = @client.videos_by(query: query)
    results.videos[0]
  end

  def add_trailer_to_playlist playlist, video
    @client.add_video_to_playlist(@playlist_id, video.video_id)
  end
end