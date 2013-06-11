class ShortController < ApplicationController
	def create
		url=params[:url].to_s
		url="http://" + url if URI.parse(url).scheme.nil?

		if $redis.exists(url)
			idx=$redis.get(url)
			@res={"result"=>"true", "url"=>idx.to_i.base62_encode}
		else
			idx=$redis.incr("idx")
			if ($redis.set(idx, url) == "OK") and ($redis.set(url,idx) == "OK")
				@res={"result"=>"true", "url"=>idx.to_i.base62_encode}
			else
				@res={"result"=>"false"}
			end
		end
		render :json => @res
	end

	def show
		url=$redis.get(params[:id].base62_decode)
		redirect_to url, :status => 301
	end
end
