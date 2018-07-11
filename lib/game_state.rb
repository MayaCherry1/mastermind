require_relative './past_guesses'
require_relative './code_generator'

class GameState

	COLORS = ['R' , 'O', 'Y', 'G', 'B', 'P']
	WIN_CONDITION = 4
	GUESS_LIMIT = 10
	CODE_LENGTH = 4

	attr_accessor :has_won, :past_guesses
	attr_reader :secret_code 

	def initialize
		@secret_code = []
		@has_won = false
		@past_guesses = PastGuesses.new
		@secret_code = CodeGenerator.generate
	end

	def remaining_guesses
		GUESS_LIMIT - past_guesses.size
	end

end