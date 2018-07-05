
require_relative './guess'

class GuessLoop

	attr_reader :past_guesses, :has_won
	attr :valid


	def initialize
		@past_guesses = []
		@valid = true
		@has_won = false
	end

	def prompt_user_guess
		print %{Remaining guesses: #{10 - @past_guesses.size}\nPlease enter code [x x x x]: }
		input = gets.chomp
	end

	def fix_input (input)
		input.upcase.tr(" ","").chars
	end

	def print_guesses (colors)
		if (!@valid)
			puts "INVALID INPUT: Please enter the first letter of the colors you wish to guess\n"
		end
		puts "Available Colors: #{colors.join(", ")}\n\n"
		past_guesses.each { |g| puts "#{g.id}: #{g.code.join(" ")}\t red: #{g.feedback[:red]}  white: #{g.feedback[:white]}"}

	end

	def loop_guesses(colors,secret)
		while (@past_guesses.size < 10)
			system("clear")
			print_guesses (colors)
			code = fix_input (prompt_user_guess)
			guess = Guess.new(@past_guesses.size + 1, code)
			@valid = guess.valid?(colors)
			if (@valid)
				@past_guesses << guess
				guess.set_feedback(secret)
			 	if (guess.feedback[:red].eql? 4) 
			 		@has_won = true
			 		return
			 	end
			end
		end
	end


end	