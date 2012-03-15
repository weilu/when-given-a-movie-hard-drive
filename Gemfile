source 'http://rubygems.org'

gem 'rails', '3.1.3'

gem 'pg'
gem 'haml'
gem 'nokogiri'
gem 'jquery-rails'
gem 'simple_form'

gem 'youtube_it'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
  gem 'bourbon', git: 'git://github.com/frankzilla/bourbon.git', branch: 'reset-addon'
end

group :development do
  gem 'heroku'
  gem 'pry'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'

  gem 'vcr'
  gem 'fakeweb'

  gem 'fixture_builder'
  gem 'factory_girl_rails'
  gem 'faker'
end
