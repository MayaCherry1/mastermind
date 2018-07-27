require_relative './game_state'
require_relative './guess'

class GameLoop

	def initialize(ui, game_state = GameState.new, guess_holder = Guess)
		@valid = true
		@ui = ui
		@game_state = game_state
		@guess_holder = Guess
	end

	def play
		@game_state = @game_state.reset
		@ui.new_game_message
		while (@game_state.remaining_guesses > 0)
			@ui.display_game_dialog(@valid, @game_state)
			input = @ui.get_user_input
			if command?(input)
				call_command(input)
			else
				guess = create_new_guess(format_code(input))
				check_validity(guess)
			    save_guess_if_valid(guess)
				break if check_win(guess)
			end
		end
		@ui.game_over(@game_state)
		play if @ui.play_again?
		@ui.exit_game
	end

		private

	def command?(input)
		input.include?('/')
	end

	def call_command(input)
		case input
		when '/HELP'
			@ui.display_how_to_play
		when '/RESTART'
			play if @ui.restart?
		when '/QUIT'
			@ui.exit_game if @ui.quit?
		else
			@ui.unknown_command
		end
	end

	def format_code(input)
		input.chars
	end

	def create_new_guess(input)
		@guess_holder.new(input, @game_state)
	end

	def check_validity(guess)
		@valid = guess.valid?
	end

	def save_guess_if_valid(guess)
		@game_state.past_guesses.save_guess(guess) if @valid
	end

	def check_win(guess)
	 	@game_state.has_won = guess.win?
	end

end