require 'yaml'
require 'active_record'
require 'erb'

env = (ENV['RACK_ENV'] || :development)

db_config = YAML.load(ERB.new(File.read('config/database.yml')).result)[env]
ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection(db_config)