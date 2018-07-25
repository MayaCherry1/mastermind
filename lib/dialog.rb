class Dialog

	def initialize(args = {})
		@output = args[:output] ||= ->(string) { puts string }
		@output_2 = args[:output_2] ||= ->(string) { print string }
	end

	def welcome
		@output.call "\nWelcome to Mastermind!" 
	end

	def game_play_directions
		@output.call """\nTo play: The computer will generate a four character color code of the following 
	colors Red (R), Orange (O), Yellow (Y), Green (G), Blue (B), Purple (P). You will try to
	guess the code by writing a sequence of four uppercase letters, each representing
	a color. Colors can be repeated and order does matter in the sequence. The computer
	will return feedback in the form of pegs: red meaning that a color exists in the
	secret code and is in the correct location; white meaning that the colo r is in the 
	secret code but is in the wrong location. You will have ten guesses."""
	end

	def game_wide_commands
	    @output.call """\n
	Additional commands:
		/help	 :to print the instructions
		/restart :to generate a new game
		/quit    :to quit the game"""
	end

	def continue_game
		@output_2.call "\npress 'enter' to continue"
	end

	def invalid_message
		@output.call "INVALID INPUT: Please enter the first letter of the colors you wish to guess\n"
	end
	
	def available_colors(colors)
		@output.call "Available Colors: #{colors.join(", ")}\n\n"
	end

	def past_guesses(past_guesses)
		@output.call past_guesses.to_string
	end

	def prompt_guess(remaining_guesses)
		@output_2.call %{\nRemaining guesses: #{remaining_guesses}\nPlease enter code [x x x x]: }
	end

	def win_game(past_guesses)
		@output.call "\nCongratulations! You won in #{past_guesses.size} guesses."
	end
	
	def lose_game
		@output.call "\nYou lost."
	end

	def display_secret(secret_code)
		@output.call "The secret code was #{secret_code.join(" ")}"
	end

	def save_option
		@output_2.call "would you like to save your progress? (Y/n): "
	end

	def quit_game
		@output.call "\nYou have quit the game."
	end

	def confirm_quit
		@output_2.call "\nAre you sure you would like to quit? (Y/n): "
	end

	def confirm_restart
		@output_2.call "\nAre you sure you would like to restart? (Y/n): " 
	end

	def play_again
		@output_2.call "\nWould you like to play again? (Y/n): "
	end

	def thanks
		@output.call "\nThanks for playing!"
	end

	def incorrect_input
		@output.call "\nCommand not recognized. Please enter \'y\' to answer yes or \'n\' to answer no."
	end
end
