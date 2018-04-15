require './app.rb'

run Rack::URLMap.new('/' => App)
