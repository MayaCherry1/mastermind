
class GameSetUp

	attr_reader :colors  
	attr_reader :code
	attr_accessor = remaining_guesses

	def initialize
	 	@colors = [ 'r' , 'o', 'y', 'g', 'b', 'p']
	 	@remaining_guesses = 10
	end

	def print_directions
		 puts %{
	To play: The computer will generate a four digit color code of the following colors
	Red (r), Orange (o), Yellow (y), Green (g), Blue (b), Purple (p). You will try to
	guess the code by writing a sequence of four lowercase letters, each representing
	a color. Colors can be repeated and order does matter in the sequence. The computer
	will return feedback in the form of pegs: red meaning that a color exists in the
	secret code and is in the correct location; white meaning that the color is in the 
	secret code but is in the wrong location. You will have ten guesses.

	Additional commands:
	/help	: to print the instructions
	/restart: to generate a new game
	/quit   : to quit the game\n\n}
	end

	def generate_code
		secret_code = []
		4.times do |i|
			secret_code << colors.sample
		end
		secret_code
	end
		# CONTROLS ## MOVE TO MASTER CLASS
		puts ("\nWelcome to Mastermind!").center(40)
		print_directions
		code = generate_code
end

Class GamePlay
	
	attr_reader guesses
	attr_reader remaining_guesses

	def initialize 
		guesses = []
		remaining_guesses = 10
	end

	def prompt_user_guess
		print %{Remaining guesses: #{remaining_guesses}\nPlease enter code [x x x x]: }
		input = STDIN.gets
		input.split(" ")
	end

	def validate_code
		valid 
		guesses[-1]. eq 4
	end
		



end

# SetUpGame


