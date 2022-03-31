class SpacesController < ApplicationController
	info = {
		replies: {
			include: {
				user: {
					include: :shield,
				},
			},
		},
		user: {
			include: :shield,
		},
		space: {},
	}

	get '/spaces' do
		Space.all.to_json
	end

	get '/spaces/posts/:space_id' do
		if params[:space_id] == 'all'
			Post.all.to_json(include: info)
		else
			id = Space.find_by(space_name: params[:space_id]).id
			Post.where('space_id = ?', id).to_json(include: info)
		end
	end
end
