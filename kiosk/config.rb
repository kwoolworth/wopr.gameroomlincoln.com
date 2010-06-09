require 'rubygems'
require 'compass'
require 'sinatra'
require 'json'

# Set applicaiton root directory
root_dir = File.dirname(__FILE__)

# Configure Compass
Compass.configuration do |config|
	config.environment = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
	config.output_style = :compressed
end

# Configure Sinatra
set :env,		(ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)
set :views,		File.join(root_dir, 'views')
set :root,		root_dir
set :run,		false
set :sass, Compass.sass_engine_options