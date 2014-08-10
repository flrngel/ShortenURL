class Passy
	# shuffled 62 string
	def initialize(str)
		@table="vcS1s3wjiUE0uKGAh4ln6IaNFzBkmq7V28XgCrHpDPfJTeQYb5RLtodMWOy9Zx";
		@ori="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
		@str=str;
	end

	def match_code(c)
		throw "`c` is not a character" if c.to_s.length != 1
		if c >= '0' and c <= '9'
			return c.ord-'0'.ord
		elsif c >= 'a' and c <= 'z'
			return c.ord-'a'.ord + 10
		elsif c >= 'A' and c <= 'Z'
			return c.ord-'A'.ord + 10 + 26
		end
	end

	def encrypt
		str=""
	 	@str.split(//).each do |c|
			str+=@table[match_code(c)].to_s
		end
		return str
	end

	def decrypt
		str=""
		@str.split(//).each do |c|
			str+=@ori[@table.to_s.index(c)].to_s
		end
		return str
	end
end
