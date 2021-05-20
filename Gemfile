source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Gems generated for normal rails 6 app:
gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# 'Aftermarket' Gems to handle app-specific details:
gem 'aws-sdk-s3', require: false # Easily connect to s3 with ruby to store files via Active Storage
gem 'image_processing', '~> 1.2' # Use Active Storage variant
gem 'devise', '~> 4.7', '>= 4.7.2' # Authentication library with tons of built-in security
gem 'devise-authy', '~> 2.2' # Two factor authentication for the more cautious
gem 'pundit', '~> 2.1' # Authorization library that uses simple PORs to check permissions

group :development, :test do
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6' # Store dev environment variables in .env file
  gem 'factory_bot_rails' # Replaces fixtures to create objects and their associations
  gem 'faker' # Useful library for generating fake data
  gem 'pry', '~> 0.12.2' # Debugger tool which works as a runtime developer console
  gem 'rspec-rails' # Prefer to use rspec over minitest due to the output clarity
end
