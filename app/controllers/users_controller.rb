class UsersController < ApplicationController
	get '/users' do
		User.all.to_json
	end

	get '/users/:user_hash' do
		user = User.find_by(user_hash: params[:user_hash])
		user.to_json(include: { shield: {}, posts: {only: :title}, replies: {}})
	end

	post '/users/new' do
		User.safe_create_new_user(params[:account])
		new_shield = Shield.create_shield(params[:account]).to_json(include: :user)
	end
end
