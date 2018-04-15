require 'sinatra/base'

class App < Sinatra::Base
	post '/create_user' do
  	request.body.rewind
  	@request_payload = JSON.parse(request.body.read)
    "Syncing user with params #{@request_payload}"
	end
end
