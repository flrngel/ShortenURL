class ShortController < ApplicationController
	def create
		url=params[:url].to_s

		while url != URI::unescape(url) do
			url=URI::unescape(url)
		end

		url=URI::escape(url)
		url="http://" + url if URI.parse(url).scheme.nil?
		
		jump_seed=Random.rand(77)
		idx=0
		1.upto(jump_seed) do |lalala|
			idx=$redis.incr("shorten:idx")
		end

		expire=params[:expire].to_i
		key = "shorten:url:"+idx.to_s
		if $redis.set(key, url) == "OK"
			$redis.incr("shorten:total")
			flag=false	
			if expire > 0
				if $redis.expire(key,expire)
					flag=true
				end
			else
				flag=true
			end

			if flag == true
				@res={"result"=>"true", "url"=>Passy.new(idx.to_i.base62_encode).encrypt}
			else
				@res={"result"=>"false"}
			end
		else
			@res={"result"=>"false"}
		end

		render :json => @res
	end

	def show
		key="shorten:url:"+Passy.new(params[:id].to_s).decrypt.base62_decode.to_s
		if $redis.exists(key)
			url=$redis.get(key)
			url=URI::unescape(url)
			redirect_to url, :status => 301
		else
			raise ActionController::RoutingError.new('Not Found')
		end
	end
end
