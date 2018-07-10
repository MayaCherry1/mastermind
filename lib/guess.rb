require_relative './pegs'

class Guess

	attr_reader :id, :code, :pegs

	def initialize(code, game_state)
		@id = game_state.past_guesses.size + 1
		@code = code
		@pegs = Pegs.new(game_state, code)
		@game_state = game_state
	end

	def valid?
		check_size && check_colors
	end

	def is_win?
		@pegs.red == 4
	end

		private 

	def check_size
		@code.size == 4 
	end

	def check_colors
		@code.all? { |c| @game_state.COLORS.include?(c) }
	end

end