class ShieldsController < ApplicationController
  
  get '/shields/:user_hash' do
    user_id = User.find_by(user_hash: params[:user_hash]).id
    shield = Shield.find_by(user_id: user_id)
    shield.to_json
  end

end