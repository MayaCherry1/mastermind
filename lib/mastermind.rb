
class Mastermind

	attr_reader :colors
	attr_accessor :code

	def initialize 
		@colors = [ 'r' , 'o', 'y', 'g', 'b', 'p']
	 	@code = []
	end

	def print_directions
		message = """\nWelcome to Mastermind!\n
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
		/quit   : to quit the game\n\n}"""

		puts (message)
	end

end


class SecretCode

	def generate (colors)
		secret_code = []
		4.times do |i|
			secret_code << colors.sample
		end
		secret_code
	end

end


class UserGuess

	attr_reader :remaining_guesses

	def initialize
		@remaining_guesses = 10
	end

	def prompt_user_guess
		print %{Remaining guesses: #{@remaining_guesses}\nPlease enter code [x x x x]: }
		input = STDIN.gets
		input = input.split(" ")

	end

	def check_size(guess)
		pass = true
		if (guess.size != 4) 
			puts ("INVALID INPUT: Please enter four colors")
			pass = false
		end
		pass
	end

	def check_colors(colors, guess)
		pass = true
		guess.each do |element| 
			if (!(colors.include?(element)))
				puts ("INVALID INPUT: Please enter only the first letter of the colors you wish to guess")
				pass = false
			end
		end
		pass
	end

	def loop_guesses(colors)
		past_guesses = []
		while (@remaining_guesses > 0)
			if (@remaining_guesses != 10) 
				puts "\n"
				past_guesses.map { |g| puts g.join }
			end
			guess = prompt_user_guess
			valid = check_colors(colors,guess) && check_size(guess)
			if (valid)
				past_guesses << guess
				@remaining_guesses -= 1
			end
		end
	end
end


def main 
	game = Mastermind.new
	game.print_directions
	game.code = SecretCode.new.generate (game.colors)	
	UserGuess.new.loop_guesses(game.colors)
	puts "Thank you for playing Mastermind!"
end


if __FILE__ == $0
	main
end

