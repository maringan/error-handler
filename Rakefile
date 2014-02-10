require 'rubygems'
require 'bundler'
require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'
require_relative 'config/application'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/api/*_spec.rb', 'spec/model/*_spec.rb', 'spec/services/*_spec.rb']
end

module Rails
  def self.application
    Struct.new(:config, :paths) do
      def load_seed
        require File.expand_path('../application', __FILE__)
        require File.expand_path('../db/seeds', __FILE__)
      end
    end.new(config, paths)
  end

  def self.config
    require 'erb'
    db_config = YAML.load(ERB.new(File.read("config/database.yml")).result)
    Struct.new(:database_configuration).new(db_config)
  end

  def self.paths
    { 'db/migrate' => ["#{root}/db/migrate"] }
  end

  def self.env
    env = ENV['RACK_ENV'] || "development"
    ActiveSupport::StringInquirer.new(env)
  end

  def self.root
    File.dirname(__FILE__)
  end
end

task :environment do
end

task :default => :spec
Rake.load_rakefile 'active_record/railties/databases.rake'