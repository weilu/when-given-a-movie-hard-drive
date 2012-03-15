class Movie < ActiveRecord::Base
  belongs_to :movie_search

  scope :year_before, ->(year){ where("year <= ?", year) }
  scope :year_after, ->(year){ where("year >= ?", year) }
  scope :rating_higher_than, ->(rating){ where("rating >= ?", rating) }
  scope :rating_lower_than, ->(rating){ where("rating <= ?", rating) }
end