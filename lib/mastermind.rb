
class Mastermind

	attr_reader :colors
	attr_accessor :secret_code

	def initialize 
		@colors = ['R' , 'O', 'Y', 'G', 'B', 'P']
	 	@secret_code = []
	end

	def print_directions
		message = """
	To play: The computer will generate a four digit color code of the following colors
	Red (R), Orange (O), Yellow (Y), Green (G), Blue (B), Purple (P). You will try to
	guess the code by writing a sequence of four uppercase letters, each representing
	a color. Colors can be repeated and order does matter in the sequence. The computer
	will return feedback in the form of pegs: red meaning that a color exists in the
	secret code and is in the correct location; white meaning that the color is in the 
	secret code but is in the wrong location. You will have ten guesses.

	Additional commands:
	/help	: to print the instructions
	/restart: to generate a new game
	/quit   : to quit the game\n\n"""
		title ="Welcome to Mastermind!" 
		puts ("\n" + title.center(100))
		puts (message)
	end

end

def main 
	game = Mastermind.new
	game.print_directions
	game.secret_code = CodeGenerator.new.generate (game.colors)	
	PlayGame.new.loop_guesses(game.colors)
	puts "Thank you for playing Mastermind!"
end

if __FILE__ == $0
	main
end