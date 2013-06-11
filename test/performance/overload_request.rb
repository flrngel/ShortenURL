require 'net/http'

uri=URI('http://flx.kr/1JID')

while 1 do
	Net::HTTP.get(uri)
end
