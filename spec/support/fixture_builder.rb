FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  #fbuilder.files_to_check += Dir["spec/factories/*.rb", "spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do
    movie_search = MovieSearch.create
    movie_search.movies.create(name: 'about a boy', year: 2002, rating: 8.3)
    movie_search.movies.create(name: 'crash', year: 2004, rating: 8.0)
    movie_search.movies.create(name: 'pulp fiction', year: 1994, rating: 9.0)
  end
end