require_relative './input'
require_relative './dialog'

class UIController

	def initialize(game_state)
		@game_state = game_state
		@dialog = Dialog.new(game_state)
		@input = Input.new
	end

	def setup
		intro_msg
		continue
	end

	def game_over
		system("clear")
		@dialog.past_guesses
		case game_state.has_won
		when true
			@dialog.win_game
		when false
			@dialog.lose_game
		end
	end

	def play_again?
		@dialog.play_again
		@input.play_again.eql?('y')
	end

	def thanks
		@dialog.thanks
	end

		private

	def intro_msg
		system("clear")
		@dialog.welcome
		@dialog.directions
	end

	def continue
		@dialog.continue_game
		@input.continue
		system("clear")
	end
end