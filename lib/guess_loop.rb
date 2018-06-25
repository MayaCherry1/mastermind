class GuessLoop

	attr_reader :past_guesses

	def initialize
		@past_guesses = []
	end

	def prompt_user_guess
		print %{Remaining guesses: #{10 - @past_guesses.size}\nPlease enter code [x x x x]: }
		gets.chomp
	end

	def fix_input (input)
		input.upcase.tr(" ","").chars
	end

	def print_guesses (past_guesses)
		puts "\n\n"
		past_guesses.each { |g| puts g.code.join " "}
	end

	def loop_guesses(colors)
		past_guesses = []
		while (@guess_number <= 10)
			print_guesses
			code = fix_input (prompt_user_guess)
			guess = Guess.new(@past_guesses.size + 1, code)
			if (guess.valid?(colors))
				@past_guesses << guess
			else
				puts "INVALID INPUT: Please enter the first letter of the colors you wish to guess"
			end 
		end
	end

end	