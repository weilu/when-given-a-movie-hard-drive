module ApplicationHelper

  def slice_movie_name_and_year movies
    movies.collect { |movie| movie.as_json(:only => [:name, :year]).with_indifferent_access }
  end

end
