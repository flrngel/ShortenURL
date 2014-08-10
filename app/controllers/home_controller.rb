class HomeController < ApplicationController
	def index
		@dbsize=($redis.get("shorten:total").to_i)
	end
end
