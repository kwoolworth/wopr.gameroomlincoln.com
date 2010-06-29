require 'config'

# Index
get '/' do
	haml :themes
end

# Get a list of all themes
get '/get' do
	content_type :json
	themes = []
	files = Dir.entries(File.join(Sinatra::Application.root, 'public'))
	files.each do |file|
		if File.exists?(File.join(Sinatra::Application.root, "public/#{file}/assets.json"))
			themes.push(JSON.parse(IO.readlines(File.join(Sinatra::Application.root, "public/#{file}/assets.json"), 'r').to_s))
		end
	end
	themes.to_json
end

# Set the default theme
get '/set/:theme' do
	content_type :json
	if(File.directory?(File.join(Sinatra::Application.root, "public/#{params[:theme]}")))
		data = { :theme => params['theme'] }
		File.open(File.join(Sinatra::Application.root, 'data/default.json'), 'w') { |f| f.write(data.to_json) }
		result = { 'success' => true, 'error' => ''}
	else
		result = { 'success' => false, 'error' => 'Theme does not exist.'}
	end	
	result.to_json
end

# Demos
get '/:theme' do
	unless params[:theme] == 'default'
		haml :"#{params[:theme]}", {:views => File.join(Sinatra::Application.root, "public/#{params[:theme]}/views")}
	else
		default = JSON.parse(IO.readlines(File.join(Sinatra::Application.root, 'data/default.json'), 'r').to_s)
		haml :"#{default['theme']}", {:views => File.join(Sinatra::Application.root, "public/#{default['theme']}/views")}
	end
end

# Theme stylesheets
get '/:theme.css' do
	content_type 'text/css', :charset => 'utf-8'
	unless params[:theme] == 'default'
		sass :"#{params[:theme]}", {:views => File.join(Sinatra::Application.root, "public/#{params[:theme]}/stylesheets")}
	else
		default = JSON.parse(IO.readlines(File.join(Sinatra::Application.root, 'data/default.json'), 'r').to_s)
		sass :"#{default['theme']}", {:views => File.join(Sinatra::Application.root, "public/#{default['theme']}/stylesheets")}
	end
end

not_found do
	redirect '/error/'
end