require 'sinatra/base'
require 'sinatra/base'
require 'sidekiq'
require 'sidekiq/api'
require 'sidekiq/web'

require_relative 'lib/workers/users/create_worker.rb'

class App < Sinatra::Base
	post '/create_user' do
  	request.body.rewind
  	@request_payload = JSON.parse(request.body.read)

    "Syncing user in background: #{Users::CreateWorker.perform_async(@request_payload)}"
	end
end
