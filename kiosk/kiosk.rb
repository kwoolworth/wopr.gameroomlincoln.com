require 'config'

# Index
get '/' do
	haml :kiosk
end

# SASS stylesheet
get '/stylesheets/:name.css' do
	content_type 'text/css', :charset => 'utf-8'
	sass :"#{params[:name]}", {:views => File.join(Sinatra::Application.root, 'stylesheets')}
end

# Redirect bad error paths to error application
get '/error' do
	redirect '/error/'
end

not_found do
	redirect '/error/'
end