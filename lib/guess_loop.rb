
require_relative './guess'

class GuessLoop

	attr_reader :past_guesses
	attr_reader :win?

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

	def print_guesses
		puts "\n\n"
		past_guesses.each { |g| puts "#{g.id}: #{g.code.join(" ")}\t red: #{g.feedback[:red]}  white: #{g.feedback[:white]}"}

	end

	def loop_guesses(colors,secret)
		while (@past_guesses.size < 10)
			print_guesses
			code = fix_input (prompt_user_guess)
			guess = Guess.new(@past_guesses.size + 1, code)
			if (guess.valid?(colors))
				@past_guesses << guess
				guess.set_feedback(secret)
			 	if (guess.feedback[:red].eql? 4) 
			 		@win = true
			 		return
			 	end
			else
				puts "INVALID INPUT: Please enter the first letter of the colors you wish to guess"
			end 
		end
		@win = false
	end


end	