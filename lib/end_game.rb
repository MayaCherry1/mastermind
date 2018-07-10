class EndGame

	def initialize (game_state, dialog, input)
		@game_state = game_state
	end

	def print_msg
		if @game_state.has_won
			dialog.win_game
		else 
			dialog.lose_game
		end
	end

	def play_again?
		dialog.play_again
		again = input.play_again
		return again.eql?('y')
	end
	
end