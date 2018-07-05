require_relative './game_setup'
require_relative './code_generator'
require_relative './guess_loop'
require_relative './end_game'

game = GameSetup.new
again = true
while(again)
	game.print_title
	game.print_directions
	game.continue
	game.secret_code = CodeGenerator.new.generate (game.colors)	
	guess = GuessLoop.new
	guess.loop_guesses(game.colors, game.secret_code)
	EndGame.new.print_msg(guess.has_won, game.secret_code, guess.past_guesses.size)
	again = game.play_again?
end
game.thanks