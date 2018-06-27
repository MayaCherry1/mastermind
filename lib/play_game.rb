class GuessLoop

	attr_reader :remaining_guesses, :past_guesses

	def initialize
		@guess_number = 1
		@past_guesses = []
	end

	def prompt_user_guess
		print %{Remaining guesses: #{11 - @guess_number}\nPlease enter code [x x x x]: }
		input = gets.chomp.upcase.tr(" ","").chars
		puts input
		return input
	end

	def print_guesses
		puts "\n\n"
		@past_guesses.each { |g| puts g.code.join " "}
	end

	def loop_guesses(colors)
		while (@guess_number <= 10)
			print_guesses
			guess = Guess.new(@guess_number, prompt_user_guess)
			if (guess.valid?(colors))
				@guess_number += 1
				@past_guesses << guess
			else
				puts "INVALID INPUT: Please enter the first letter of the colors you wish to guess"
			end 
		end
	end

end	