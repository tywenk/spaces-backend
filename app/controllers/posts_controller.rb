class PostsController < ApplicationController
	info = {
		replies: {
			only: %i[user_id created_at],
		},
		user: {
			include: :shield,
		},
		space: {},
	}

	get '/posts' do
		Post.all.to_json
	end

	get '/posts/:id' do
		post = Post.find params[:id]
		post.to_json(include: info)
	end

	post '/posts' do
		user_id = User.find_by_hash(params[:user_hash]).id

		post =
			Post.create(
				title: params[:title],
				content: params[:content],
				views: params[:views],
				user_id: user_id,
				space_id: Space.find_by('space_name = ?', params[:space_name]).id,
			)
		post.to_json(include: info)
	end

	delete '/posts/:id' do
		post = Post.find(params[:id])
		post.destroy
		post.to_json
	end
end
