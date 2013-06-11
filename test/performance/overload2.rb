require 'uri'
require 'net/http'

uri=URI('http://127.0.0.1/create');
1.upto(2147483647) do |i|
	res=Net::HTTP.post_form(uri,'url'=>'placebo.kr/mas;laksjdf;lkjas;dflkja;sdkfja;skldjf;aksjfd;klajsdl;fkjasdfjoiwjfoiwejfoiwjeofijweofjlkdsjflksdjflaks;aslkdjf;aklsdjf;kalsjd;fklasj;dfklja;skdlfj;aksldjfoiwjefoijwoeifj23098jf2i3jfo23jfoi2j3oifj2o3ijfoj23oifj23oijfo2i3jfo2ijfoi2j3foij23oifj23teryi'+i.to_s)
	puts res.body
end
