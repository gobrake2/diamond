# pure ruby

class Blockchain
	
	def initialize
		@chain = []

		
	end

	def mining
		history = []
		current_time = Time.now.to_f
		begin 
			nonce = rand(1000000)
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..3]!='0000'
		nonce


		block = {
			"index" => @chain.size + 1,
			"time" => Time.now,
			"nonce" => nonce,
			"previous_address" => Digest::SHA256.hexdigest(last_block.to_s)
		}

		@chain << block
		block

	end

	def all_blocks
		@chain
	end

	def last_block
		@chain[-1]
	end



end

