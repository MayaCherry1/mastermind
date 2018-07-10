require_relative './past_guesses'

class GameState

	attr_reader :COLORS
	attr_accessor :secret_code, :has_won, :past_guesses

	GUESS_LIMIT = 10
	
	def initialize
		@secret_code = []
		@has_won = false
		@past_guesses = PastGuesses.new
		@COLORS = ['R' , 'O', 'Y', 'G', 'B', 'P']
	end

	def remaining_guesses
		GUESS_LIMIT - past_guesses.size
	end

end