require 'config'

# Index
get '/' do
	haml :update
end

# SASS stylesheet
get '/stylesheets/:name.css' do
	content_type 'text/css', :charset => 'utf-8'
	sass :"#{params[:name]}", {:views => File.join(Sinatra::Application.root, 'stylesheets')}
end