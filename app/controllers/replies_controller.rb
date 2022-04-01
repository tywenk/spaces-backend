class RepliesController < ApplicationController
	get '/replies' do
		Reply.all.to_json
	end

	get '/replies/:post_id' do
		id = params[:post_id]
		Reply
			.where('post_id = ?', id)
			.to_json(include: { user: { include: :shield } })
	end

	post '/replies' do
		user_id = User.find_by_hash(params[:user_hash]).id

		new_reply =
			Reply.create(
				content: params[:content],
				user_id: user_id,
				post_id: params[:post_id],
			)
		new_reply.to_json(include: { user: { include: :shield } })
	end

	patch '/replies/:id' do
		reply = Reply.find(params[:id])
		reply.update(content: params[:content])
		reply.to_json
	end

	delete '/replies/:id' do
		post = Reply.find(params[:id])
		post.destroy
		post.to_json
	end
end
