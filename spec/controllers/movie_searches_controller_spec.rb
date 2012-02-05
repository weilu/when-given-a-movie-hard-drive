require 'spec_helper'

describe MovieSearchesController do
  render_views

  describe 'GET show' do
    let(:request) { get :show, id: MovieSearch.last.id }
    before { request }

    it { response.should be_success }

    it { assigns(:movies).should == MovieSearch.last.movies }

    describe 'response body' do
      subject { response.body }

      it { should have_css("table") }
      it { should have_css("form input[type='submit']") }
    end

  end

  describe 'POST find_trailers' do
    let(:request) { post :find_trailers, id: MovieSearch.last.id }

    before do
      VCR.use_cassette('youtube') do
        request
      end
    end

    it { assigns(:client).should_not be_nil }
  end
end