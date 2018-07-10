require_relative './guess'

class GameLoop

	attr_reader :past_guesses, :has_won
	
	GUESS_LIMIT = 10
	WIN_CONDITION = 4

	def initialize(game_state, dialog, input)
		@valid = true
		@game_state = game_state
		@dialog = dialog
		@input = input
	end

	def play
		while (@game_state.remaining_guesses > 0)
			system("clear")
			display_game_dialog
			guess = create_new_guess
			check_validity(guess)
		    save_guess_if_valid(guess)
			return if check_win(guess)
		end
	end

		private

	def display_game_dialog
		@dialog.invalid_message unless @valid
		@dialog.available_colors
		@dialog.past_guesses
		@dialog.input_prompt
	end

	def create_new_guess
		Guess.new(@input.get_user_guess, @game_state)
	end

	def check_validity(guess)
		@valid = guess.valid?
	end

	def save_guess_if_valid(guess)
		@game_state.past_guesses.save_guess(guess) if @valid
	end

	def check_win(guess)
	 	@game_state.has_won = true if guess.is_win?
	end

end	