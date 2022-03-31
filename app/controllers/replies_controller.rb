class RepliesController < ApplicationController
	get '/replies' do
		Reply.all.to_json
	end

	get '/replies/:post_id' do
		id = params[:post_id]
		Reply
			.where('post_id = ?', id)
			.to_json(include: { replies: { include: :user }, user: {}, space: {} })
	end

	post '/replies' do
		user_id = User.find_by_hash(params[:user_hash]).id

		reply =
			Reply.create(
				content: params[:content],
				user_id: user_id,
				post_id: params[:post_id],
			)
		reply.to_json(include: { user: { include: :shield } })
	end
end
