class ApplicationController < Sinatra::Base
	set :default_content_type, 'application/json'

	get '/' do
		{ message: 'This is the backend for Spaces' }.to_json
	end
end
