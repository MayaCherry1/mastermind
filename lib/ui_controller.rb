require_relative './input'
require_relative './dialog'

class UIController

	def initialize(args = {})
		@dialog = args[:dialog] ||= Dialog.new
		@input = args[:input] ||= Input.new
	end

	def new_game_message
		system('clear')
		@dialog.welcome
		@dialog.game_play_directions
		@dialog.game_wide_commands
	end

	def restore?
		begin
			@dialog.restore_game
			return yes?(false)
		rescue 
			@dialog.incorrect_input
			restore?
		end
	end
	
	def display_game_dialog(valid, game_state)
		system("clear")
		@dialog.invalid_message unless valid
		@dialog.available_colors(GameState::COLORS)
		@dialog.past_guesses(game_state.past_guesses)
		@dialog.prompt_guess(game_state.remaining_guesses)
	end

	def get_user_input
		@input.get_user_input
	end

	def display_how_to_play
		@dialog.game_play_directions
		@dialog.game_wide_commands
		continue
	end

	def restart?
		begin
			@dialog.confirm_restart
			return yes?
		rescue 
			@dialog.incorrect_input
			restart?
		end
	end

	def save
		@dialog.save_statement
	end

	def quit?
		begin
			@dialog.confirm_quit
			yes?
		rescue 
			@dialog.incorrect_input
			quit?
		end
	end

	def unknown_command
		@dialog.game_wide_commands
		continue
	end

	def game_over(game_state)
		system("clear")
		@dialog.past_guesses(game_state.past_guesses)
		game_state.has_won ? @dialog.win_game(game_state.past_guesses) : @dialog.lose_game
		@dialog.display_secret(game_state.secret_code)
	end

	def play_again?
		@dialog.play_again
		begin
			return yes?
		rescue 
			@dialog.incorrect_input
			play_again?
		end
	end

	def exit_game
		abort 'Thanks for playing!'
	end

	def continue
		@dialog.continue_game
		@input.get_user_input
		system("clear")
	end

	def yes?(default = true)
		case @input.get_user_input
		when 'Y'
			return true
		when 'N'
			return false
		when ''
			return default
		else 
			raise 'Invalid input: please enter y or n'
		end
	end
	
end