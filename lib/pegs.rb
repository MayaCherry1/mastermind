class Pegs

	attr_reader :red, :white

	def initialize (guess_code, game_state)
		@secret_code = game_state.secret_code.clone 
		@guess_code = guess_code.clone
		check_red 
		check_white 
		@red = count_red
		@white = count_white
end

		private

	def check_red
		4.times do |i| 
			if @secret_code[i].eql? @guess_code[i] 
				@secret_code[i] = '+'
				@guess_code[i] = '.'
			end
		end
	end

	def check_white
		4.times do |i| 
			4.times do |j|
				if @secret_code[i].eql? @guess_code[j] 
					@secret_code[i] = '-'
					@guess_code[j] = '.'
				end
			end
		end
	end

	def count_red
		@secret_code.count('+')
	end

	def count_white
		@secret_code.count('-')
	end

end 
