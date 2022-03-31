class UsersController < ApplicationController
	get '/users' do
		User.all.to_json
	end

	post '/users/new' do
		User.safe_create_new_user(params[:account])
		new_shield = Shield.create_shield(params[:account]).to_json(include: :user)
	end
end
