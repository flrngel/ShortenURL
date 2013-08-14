class ShortController < ApplicationController
	def create
		url=params[:url].to_s

		while url != URI::unescape(url) do
			url=URI::unescape(url)
		end

		url=URI::escape(url)
		url="http://" + url if URI.parse(url).scheme.nil?

		if $redis.exists(url)
			idx=$redis.get(url)
			@res={"result"=>"true", "url"=>idx.to_i.base62_encode}
		else
			idx=$redis.incr("idx")
			expire=params[:expire].to_i
			if ($redis.set(idx, url) == "OK") and ($redis.set(url,idx) == "OK")
				flag=false	
				if expire > 0
					if $redis.expire(idx,expire) and $redis.expire(url,expire)
						flag=true
					end
				else
					flag=true
				end

				if flag == true
					@res={"result"=>"true", "url"=>idx.to_i.base62_encode}
				else
					@res={"result"=>"false"}
				end
			else
				@res={"result"=>"false"}
			end
		end
		render :json => @res
	end

	def show
		if $redis.exists(params[:id].base62_decode)
			url=$redis.get(params[:id].base62_decode)
			redirect_to url, :status => 301
		else
			raise ActionController::RoutingError.new('Not Found')
		end
	end
end
