require_relative './guess'
require_relative './input'
require_relative './dialog'

class GameLoop

	def initialize(game_state, input = Input.new)
		@valid = true
		@game_state = game_state
		@dialog = Dialog.new(game_state)
		@input = input
	end

	def play
		while (@game_state.remaining_guesses > 0)
			display_game_dialog
			guess = create_new_guess
			check_validity(guess)
		    save_guess_if_valid(guess)
			return if check_win(guess)
		end
	end

		private

	def display_game_dialog
		system("clear")
		@dialog.invalid_message unless @valid
		@dialog.available_colors
		@dialog.past_guesses
		@dialog.prompt_guess
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
