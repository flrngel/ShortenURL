require 'redis'
redis=Redis.new
1.upto(1293819) do |i|
	idx=redis.incr('idx')
	redis.set(idx,'adlkfjalskdjflkasjdfasdf'+i.to_s)
	redis.set('adlkfjalskdjflkasjdfasdf'+i.to_s,idx)
end
