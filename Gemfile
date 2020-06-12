source 'https://rubygems.org'

ruby "2.6.3"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'country_select', '~> 4.0'
gem 'countries', require: 'countries/global'
gem 'wicked'
gem 'unsplash'
gem "lazyload-rails"
gem "omniauth-facebook"
gem 'omniauth'
gem "aws-sdk-s3"


# Use clearance for simple auth without devise
gem 'clearance', '~> 1.16'
gem 'shrine', '~> 2.6'
gem 'rails_emoji_picker'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'carrierwave'
gem 'mini_magick'
gem 'friendly_id', '~> 5.2.4' 
gem 'materialize-sass', '~> 1.0.0'
gem 'fog'
gem "font-awesome-rails"
gem 'geocoder'
gem 'nprogress-rails'
gem 'rails', '~> 5.0.7'
gem 'popper_js', '~> 1.14.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.2'
gem 'bcrypt-ruby', '3.1.5', :require => 'bcrypt'
gem 'redis-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
  gem 'pg'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'sqlite3', '~> 1.3.13'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
