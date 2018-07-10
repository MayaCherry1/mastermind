class Pegs

	attr :secret, :guess
	attr_reader :red, :white

	def initialize (game_state, guess)
		@secret = game_state.secret_code.clone 
		@guess = guess.clone
		check_red
		check_white
		@red = count_red
		@white = count_white
	end

		private

	def check_red
		4.times do |i| 
			if @secret[i].eql? @guess[i] 
				@secret[i] = '+'
				@guess[i] = '.'
			end
		end
	end

	def check_white
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
