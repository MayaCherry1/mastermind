class Dialog

	def initialize(game_state, args = {})
		@game_state = game_state
		@output = args[:output] ||= ->(string) { puts string }
		@output_2 = args[:output_2] ||= ->(string) { print string }
	end

	def welcome
		@output.call "\nWelcome to Mastermind!" 
	end

	def directions
		@output.call """\nTo play: The computer will generate a four character color code of the following 
	colors Red (R), Orange (O), Yellow (Y), Green (G), Blue (B), Purple (P). You will try to
	guess the code by writing a sequence of four uppercase letters, each representing
	a color. Colors can be repeated and order does matter in the sequence. The computer
	will return feedback in the form of pegs: red meaning that a color exists in the
	secret code and is in the correct location; white meaning that the color is in the 
	secret code but is in the wrong location. You will have ten guesses."""
	end

	# def universal_commands
	#     @output.call """\n\n\n
	# Additional commands:
	# 	/help	 :to print the instructions
	# 	/restart :to generate a new game
	# 	/quit    :to quit the game"""
	# end

	def continue_game
		@output_2.call "\npress 'enter' to continue"
	end

	def invalid_message
		@output.call "INVALID INPUT: Please enter the first letter of the colors you wish to guess\n"
	end
	
	def available_colors
		@output.call "Available Colors: #{GameState::COLORS.join(", ")}\n\n"
	end

	def past_guesses
		@output.call @game_state.past_guesses.to_string
	end

	def prompt_guess 
		@output_2.call %{\nRemaining guesses: #{@game_state.remaining_guesses}\nPlease enter code [x x x x]: }
	end

	def win_game
		@output.call "\nCongratulations! The secret code was #{@game_state.secret_code.join(" ")}."
		@output.call "You won in #{@game_state.past_guesses.size} guesses."
	end
	
	def lose_game
		@output.call "\nYou lost. The secret code was #{@game_state.secret_code.join(" ")}."
	end

	# def quit_game
	# 	@output.call "\nYou quit. The secret code was #{game_state.secret.join(" ")}"
	# end

	def play_again
		@output_2.call "\nWould you like to play again? (y/n): "
	end

	def thanks
		@output.call "\nThanks for playing!"
	end

end
