require './lib/operations/users/create'

module Users
  class CreateWorker
  	include Sidekiq::Worker
  	def perform(params)
      user = Users::Create.new(params)
      user.save
  	end
  end
end
