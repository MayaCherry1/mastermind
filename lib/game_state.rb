require_relative './past_guesses'
require_relative './code_generator'

class GameState

	COLORS = ['R' , 'O', 'Y', 'G', 'B', 'P']
	WIN_CONDITION = 4
	GUESS_LIMIT = 10
	CODE_LENGTH = 4

	attr_accessor :has_won, :past_guesses, :quit, :restart
	attr_reader :secret_code 

	def initialize(pg = PastGuesses, sc = CodeGenerator)
		@has_won = false
		@past_guesses = pg.new				##RENAME pg and sc
		@secret_code = sc.generate
	end

	def remaining_guesses
		GUESS_LIMIT - past_guesses.size
	end

end