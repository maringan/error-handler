source 'https://rubygems.org'

gem 'rack'
gem 'grape'
gem 'grape-swagger'
gem 'activerecord', '~>3.2.15', require: 'active_record'
gem 'rake'
gem 'racksh'

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :test do
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'factory_girl'
end

group :production do
  gem 'pg'
end
