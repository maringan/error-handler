source "https://rubygems.org"

gem 'rack', '~> 1.5.2'
gem 'grape', '~> 0.5.0'
gem 'grape-swagger'
gem 'activerecord', '~>3.2.13', require: 'active_record'

gem 'sqlite3', group: [:development, :test]

group :test do
  gem 'rspec'
end

group :production do
  gem 'pg'
end