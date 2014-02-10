$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app/api'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require_relative 'environment'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../../app/api/*/base.rb', __FILE__),
    File.expand_path('../../app/api/*/v*.rb', __FILE__),
    File.expand_path('../../app/model/*.rb', __FILE__)].each do |f|
  require f
end

require 'api'