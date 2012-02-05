class MoviesController < ApplicationController
  def home
  end

  def search
    if params[:movie_list].blank?
      render :home
    end

    movie_search = search_imdb params[:movie_list]
    redirect_to movie_search_path(movie_search)
  end

end