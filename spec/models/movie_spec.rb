require 'spec_helper'

describe Movie do
  it { should belong_to(:movie_search) }

  context('filter scopes') do
    let!(:movie){ FactoryGirl.create(:movie, year: 2005, rating: 8.5) }

    it('has a year_before filter') do
      Movie.year_before(2004).should_not include(movie)
    end

    it('has a year_after filter') do
      Movie.year_after(2004).should include(movie)
    end

    it ('has a rating_higher_than filter') do
      Movie.rating_higher_than(8).should include(movie)
    end

    it('has a rating_lower_than filter') do
      Movie.rating_lower_than(8).should_not include(movie)
    end
  end
end