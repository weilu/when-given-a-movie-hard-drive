require 'spec_helper'

describe ApplicationHelper do

  let!(:movies){ FactoryGirl.create_list(:movie, 3) }
  subject{ helper.slice_movie_name_and_year(movies) }

  describe 'slice_movie_name_and_year' do
    #it{ puts "subject: #{subject[0].inspect}" }
    its(:size){ should == movies.size }
    it{ subject[0].should have_key(:name) }
    it{ subject[0].should have_key(:year) }
  end
end