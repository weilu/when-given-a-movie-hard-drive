class CreateMovieSearches < ActiveRecord::Migration
  def change
    create_table :movie_searches do |t|
      t.timestamps
    end

    add_column :movies, :movie_search_id, :integer
  end
end
