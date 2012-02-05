require 'spec_helper'

describe Movie do
  it { should belong_to(:movie_search) }
  #it { should have_scope :before }
end