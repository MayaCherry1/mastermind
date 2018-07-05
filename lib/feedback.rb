class Feedback 
	attr :secret, :guess


	def initialize (secret, guess)
		@secret = secret.clone 
		@guess = guess.clone
	end

	def generate 
		red_pegs
		white_pegs
		return {:white => count_white, :red => count_red}
	end

	def red_pegs
		4.times do |i| 
			if @secret[i].eql? @guess[i] 
				@secret[i] = '+'
				@guess[i] = '.'
			end
		end
	end

	def white_pegs
		4.times do |i| 
			4.times do |j|
				if @secret[i].eql? @guess[j] 
					@secret[i] = '-'
					@guess[j] = '.'
				end
			end
		end
	end

	def count_red
		@secret.count('+')
	end

	def count_white
		@secret.count('-')
	end

end 
