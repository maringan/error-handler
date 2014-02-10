require 'yaml'
require 'active_record'

env = (ENV['RACK_ENV'] || :development)

db_config = YAML.load(File.read('config/database.yml'))[env]
ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.establish_connection(db_config)