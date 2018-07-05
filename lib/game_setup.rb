
class GameSetup

	attr_reader :colors
	attr_accessor :secret_code

	def initialize 
		@colors = ['R' , 'O', 'Y', 'G', 'B', 'P']
	 	@secret_code = []
	end

	def print_title
		system("clear")	
		puts "\nWelcome to Mastermind!" 
	end

	def print_directions
	puts """\nTo play: The computer will generate a four character color code of the following 
	colors Red (R), Orange (O), Yellow (Y), Green (G), Blue (B), Purple (P). You will try to
	guess the code by writing a sequence of four uppercase letters, each representing
	a color. Colors can be repeated and order does matter in the sequence. The computer
	will return feedback in the form of pegs: red meaning that a color exists in the
	secret code and is in the correct location; white meaning that the color is in the 
	secret code but is in the wrong location. You will have ten guesses.

	Additional commands:
	/help	: to print the instructions
	/restart: to generate a new game
	/quit   : to quit the game\n\n"""
	end

	def continue
		print "\npress 'enter' to continue"
		gets.chomp
		system("clear")		
	end

	def play_again?
		print "\nWould you like to play again? (y/n): "
		input = gets.chomp.downcase.tr(" ","")
		return input.eql?('y')
	end

	def thanks
		puts "Thanks for playing!"
	end


end
