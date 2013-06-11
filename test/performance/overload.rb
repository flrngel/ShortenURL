require 'uri'
require 'net/http'

uri=URI('http://127.0.0.1/create');
1.upto(2147483647) do |i|
	res=Net::HTTP.post_form(uri,'url'=>'placebo.kr/masteryi'+i.to_s)
	puts res.body
end
