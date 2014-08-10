class HomeController < ApplicationController
	def index
		@dbsize=($redis.get("short:idx").to_i)
	end
end
