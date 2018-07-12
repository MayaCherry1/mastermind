require_relative './game_state'
require_relative './ui_controller'
require_relative './game_loop'

input = Input.new
loop do
	game_state = GameState.new
	@ui = UIController.new(game_state)
	@ui.setup
	GameLoop.new(game_state).play
	@ui.game_over
	break unless @ui.play_again?
end
@ui.thanks