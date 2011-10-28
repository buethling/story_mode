source :rubygems

gem 'rails', '3.1.0'

gem 'sqlite3-ruby', '1.3.3', :require => 'sqlite3'
gem 'gravatar_image_tag', '1.0.0'
gem 'will_paginate', '3.0.0'
gem 'jquery-rails'

group :assets do
#  gem 'sass-rails', "  ~> 3.1.0"
#  gem 'coffee-rails', "~> 3.1.0"
#  gem 'uglifier'

  group :development, :test do 
#    gem 'therubyracer'
  end

  group :production do 
#    gem 'therubyracer-heroku'
  end
end

group :development do
  gem 'faker', '1.0.0'
end

group :production do
  gem "pg"
end

group :test do
  gem 'simplecov'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rails-assets'
  gem 'guard-bundler'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
 
  platforms :mswin, :mingw do
    gem 'rb-fchange'
    gem 'rb-notifu'
    gem 'win32console'
  end
end
