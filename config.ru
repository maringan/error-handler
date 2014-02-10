require_relative 'config/application.rb'
require 'yaml'

env_path = File.expand_path('../application.yml', __FILE__)
if File.exist?(env_path)
  env = YAML.load_file(env_path)
  env.each{|k,v| ENV[k] = v }
end

run App::Api