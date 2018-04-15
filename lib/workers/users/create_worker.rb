module Users
  class CreateWorker
  	include Sidekiq::Worker
  	def perform(params)
      puts ['worker params', params]
      sleep 5
  	end
  end
end
