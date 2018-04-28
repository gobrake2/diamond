# sinatra

require 'sinatra'
require './block'

i1 = Blockchain.new

get '/'do 
	
	message = "<center>"

	"< 블럭 리스트 입니다. >"
	i1.all_blocks.each do |b|
		message << "번호: " + b['index'].to_s + "<br>"
		message << "시간: " + b['time'].to_s + "<br>"
		message << "Nonce: " + b['nonce'].to_s + "<br>"
		message << "앞 주소: " + b['previous_address'].to_s + "<br>"
		message << "내 주소: " + Digest::SHA256.hexdigest(b.to_s) + "<br>"

		message << "<hr>"
	end
	message + "</center>"
end

get '/mine' do

	i1.mining.to_s
	

end
