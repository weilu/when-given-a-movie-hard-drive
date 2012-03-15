require 'spec_helper'

describe MovieSearchesController do
  render_views

  describe 'GET show' do
    let(:request) { get :show, id: MovieSearch.last.id }
    before { request }

    it { response.should be_success }

    it { assigns(:movies).should == MovieSearch.last.movies.scoped }

    context('with year and rating filters') do
      let(:request) { get :show, id: MovieSearch.last.id, year_before: 2005, year_after: 2000 }
      #it { assigns(:movies).should have_scope(:year_before, 2005) }
      #it { assigns(:movies).should have_scope(:year_after, 2000) }
    end

    describe 'response body' do
      subject { response.body }

      it { should have_css("table") }
      it { should have_css("form input[type='submit']") }
    end

  end

  describe 'POST find_trailers' do
    let(:movie_search){ MovieSearch.last }
    let(:request) { post :find_trailers,
                         id: movie_search.id,
                         movies: [{ name: 'about a boy', year: 2004 }].to_json }

    before do
      VCR.use_cassette('youtube') do
        request
      end
    end

    it { assigns(:client).should_not be_nil }
  end
end