require 'spec_helper'

describe MoviesController do
  render_views

  describe 'GET home' do
    let(:request) { get :home }
    before { request }

    it { response.should be_success }

    it "has a form to fill in" do
      response.body.should have_css("form textarea")
    end
  end

  describe 'POST search' do
    let(:params) { {movie_list: "Crash\nPulp Fiction\nFinding Neverland\nShakespeare in Love [1998]"} }
    let(:request) do
      VCR.use_cassette('imdb') do
        post :search, params
      end
    end

    it "creates a new movie_search" do
      expect {
        request
      }.to change(MovieSearch, :count).by(1)
    end

    it "saves search results in the database" do
      expect {
        request
      }.to change(Movie, :count).by(4)
    end
  end
end