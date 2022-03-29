class PostsController < ApplicationController
	get '/posts' do
		Post.all.to_json
	end

	get '/posts/:id' do
		post = Post.find params[:id]
		post.to_json
	end

	post '/posts' do
		post =
			Post.create(
				title: params[:title],
				content: params[:content],
				views: params[:views],
				user_id: params[:user_id],
				space_id: Space.find_by('space_name = ?', params[:space_name]).id,
			)
		post.to_json
	end
end
