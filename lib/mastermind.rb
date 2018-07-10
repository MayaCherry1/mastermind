require_relative './code_generator'
require_relative './game_loop'
require_relative './end_game'
require_relative './dialog'
require_relative './input'
require_relative './game_state'

again = true
while(again)
	game_state = GameState.new
	dialog = Dialog.new(game_state)
	input = Input.new
	system("clear")
	dialog.welcome
	dialog.game_play_directions
	dialog.continue_game
	input.continue
	system("clear")
	game_state.secret_code = CodeGenerator.generate(game_state)	

	GameLoop.new(game_state, dialog, input).play

	end_game = EndGame.new(game_state, dialog, input)
	end_game.print_msg
	again = end_game.play_again?

end 
dialog.thanks
