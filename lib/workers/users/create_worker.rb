require './lib/operations/users/create'

module Users
  class CreateWorker
  	include Sidekiq::Worker
  	def perform(params)
      Users::Create.new(params)
  	end
  end
end
