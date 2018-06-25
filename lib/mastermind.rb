
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


class CodeGenerator

	def generate (colors)
		4.times.map { |c| colors.sample }
	end

end


class Guess 

	attr_reader :id, :code

	def initialize (id, code)
		@id = id
		@code = code
	end

	def valid? (colors)
		check_size && check_colors(colors)
	end

	def check_size
		@code.size == 4 
	end

	def check_colors (colors)
		@code.all? { |c| colors.include?(c) }
	end

end


class PlayGame

	attr_reader :remaining_guesses, :past_guesses

	def initialize
		@guess_number = 1
		@past_guesses = []
	end

	def prompt_user_guess
		print %{Remaining guesses: #{11 - @guess_number}\nPlease enter code [x x x x]: }
		gets.chomp.upcase.tr(" ","").split(//)
	end

	def print_guesses
		puts "\n\n"
		@past_guesses.map { |g| puts g.code.join " "}
	end

	def loop_guesses(colors)
		while (@guess_number <= 10)
			print_guesses
			guess = Guess.new(@guess_number, prompt_user_guess)
			if (guess.valid?(colors))
				@guess_number += 1
				@past_guesses << guess
			else
				puts "INVALID INPUT: Please enter the first letter of the colors you wish to guess"
			end 
		end
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


	# message = ("INVALID INPUT: Please enter four colors")
	# puts red(message)

	# message = ("INVALID INPUT: Please enter the first letter of the colors you wish to guess")
	# puts red(message)	


	# def colorize(text, color_code)
	# 	"\e[#{color_code}m#{text}\e[0m"
	# end

	# def red(text); colorize(text, 31); end

