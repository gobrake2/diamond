# sinatra

require 'sinatra'
require './block'

blockchain = Blockchain.new

get '/'do 
	
	message = "<center>"

	"< 블럭 리스트 입니다. >"
	blockchain.all_blocks.each do |b|
		message << "번호: " + b['index'].to_s + "<br>"
		message << "시간: " + b['time'].to_s + "<br>"
		message << "Nonce: " + b['nonce'].to_s + "<br>"
		message << "앞 주소: " + b['previous_address'].to_s + "<br>"
		message << "내 주소: " + Digest::SHA256.hexdigest(b.to_s) + "<br>"
		message << "Transactions: " + b["transactions"].to_s + "<br>"

		message << "<hr>"
	end
	message + "</center>"
end

get '/mine' do
	blockchain.mining.to_s
end

get '/trans' do
	blockchain.make_a_trans(params["sender"], params["recv"], params["amount"]).to_s
	#params["sender"] + params["recv"] +params["amount"]
end

get '/new_wallet' do
	blockchain.make_a_new_wallet.to_s

end

get '/all_wallet' do
	blockchain.show_all_wallet.to_s

end

get '/number_of_blocks' do
	blockchain.all_blocks.size.to_s
end

get '/ask' do
	blockchain.ask_other_block
end

get '/add_node' do
	blockchain.add_node(params[:node])
end

get '/recv' do
	recv_block = JSON.parse(params["blocks"])
	blockchain.recv(recv_block)
	blockchain.all_blocks.to_json
end
