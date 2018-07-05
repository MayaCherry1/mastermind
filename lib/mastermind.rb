require_relative './game_setup'
require_relative './code_generator'
require_relative './guess_loop'

	game = GameSetup.new
	puts game.title
	puts game.directions
	game.secret_code = CodeGenerator.new.generate (game.colors)	
	GuessLoop.new.loop_guesses(game.colors, game.secret_code)