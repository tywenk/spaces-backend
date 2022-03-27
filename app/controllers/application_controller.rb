class ApplicationController < Sinatra::Base
	set :default_content_type, 'application/json'

	# Add your routes here
	get '/' do
		{ message: 'Good luck with your project!' }.to_json
	end

	get '/users' do
		User.all.to_json
	end

	get '/spaces' do
		Space.all.to_json
	end

	get '/posts' do
		Post.all.to_json
	end

	get '/replies' do
		Reply.all.to_json
	end
end
