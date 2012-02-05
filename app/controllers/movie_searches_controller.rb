class MovieSearchesController < ApplicationController
  def show
    @movies = MovieSearch.find(params[:id]).movies
  end
end