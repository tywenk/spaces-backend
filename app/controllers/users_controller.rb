class UsersController < ApplicationController
	get '/users' do
		User.all.to_json
	end
end
