require_relative './mastermind'
require_relative './code_generator'
require_relative './guess_loop'

	game = Mastermind.new
	game.print_directions
	game.secret_code = CodeGenerator.new.generate (game.colors)	
	GuessLoop.new.loop_guesses(game.colors)
	puts "Thank you for playing Mastermind!"