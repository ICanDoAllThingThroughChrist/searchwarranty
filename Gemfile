source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# gem 'rmagick'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rgeo"
gem 'rails', '~> 5.0'
gem 'activerecord-import'
#retest for activerecord-postgis-adapter gem
# gem 'activerecord-postgis-adapter', '~> 6.0'
# gem 'rails', '~> 5.0', '>= 5.2.1'
# Use postgresql as the database for Active Record
gem 'by_star'
gem 'chronic'
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'parse-stack'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'parse-server-sdk', '~> 2.3', '>= 2.3.3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'pry'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# gem 'daru', '~> 0.1.5'
# gem 'daru-view'
# gem 'spreadsheet', '~> 1.1.1'
# gem 'mechanize', '~> 2.7.5'
gem 'seed_dump'
gem 'foreman', '~> 0.82.0'
gem 'csvreader', '~> 1.2', '>= 1.2.3'
# gem 'pry-byebug', '~> 3.4'
# gem 'open-uri'
# gem 'csvreader'
# gem 'byebug'
gem 'csv'
# gem 'hirb'
gem 'table_print', '~> 1.5', '>= 1.5.6'
gem 'pry-byebug', '~> 3.8'
gem 'pivot_table', '~> 1.0'
gem 'scenic', '~> 1.5', '>= 1.5.2'
gem 'time_difference', '~> 0.4.2'
# # gem 'rbczmq', '~> 1.7', '>= 1.7.9'
# gem 'ffi-rzmq', '~> 2.0', '>= 2.0.7'
# gem 'iruby', '~> 0.4.0'
# # fetch from the github master branch
# # gem 'daru-view', '~> 0.1.0'
gem 'daru', '~> 0.2.2'
# gem 'nyaplot', '~> 0.1.6'
# gem 'google_visualr', '~> 2.5', '>= 2.5.1'
# gem 'daru-data_tables', '~> 0.3.5'
# gem 'thamble', '~> 1.0', '>= 1.0.2'
gem 'bootsnap', '~> 1.1', '>= 1.1.7'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
