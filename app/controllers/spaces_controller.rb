class SpacesController < ApplicationController
	get '/spaces' do
		Space.all.to_json
	end

	get '/spaces/posts/:space_id' do
		if params[:space_id] == 'all'
			Post.all.to_json(
				include: {
					replies: {
						include: :user,
					},
					user: {},
					space: {},
				},
			)
		else
			id = Space.find_by(space_name: params[:space_id]).id
			Post
				.where('space_id = ?', id)
				.to_json(include: { replies: { include: :user }, user: {}, space: {} })
		end
	end
end
