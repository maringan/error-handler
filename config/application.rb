env = ENV['RACK_ENV'] || 'development'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app/api'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require_relative 'environment'

Bundler.require :default, env

Dir[File.expand_path('../../app/api/*/base.rb', __FILE__),
    File.expand_path('../../app/models/*.rb', __FILE__),
    File.expand_path('../../app/services/*.rb', __FILE__),
    File.expand_path('../../lib/*.rb', __FILE__),
    File.expand_path('../../app/workers/*.rb', __FILE__),
    File.expand_path('../../app/api/*/v*.rb', __FILE__)
    ].each do |f|
  require f
end

I18n.enforce_available_locales = false

require 'api'