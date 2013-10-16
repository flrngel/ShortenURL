class HomeController < ApplicationController
	def index
		@dbsize=($redis.dbsize.to_i/2).to_i
	end
end
