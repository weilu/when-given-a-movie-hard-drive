require 'spec_helper'

describe MovieSearchesController do
  render_views

  describe 'GET show' do
    let(:request) { get :show, id: MovieSearch.last.id }
    before { request }

    it { response.should be_success }

    it { assigns(:movies).should == MovieSearch.last.movies }

    it 'displays the movies found in a table' do
      response.body.should have_css("table")
    end
    
  end
end