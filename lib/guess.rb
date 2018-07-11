require_relative './pegs'

class Guess

	attr_reader :id, :code, :pegs

	def initialize(code, game_state)
		@id = game_state.past_guesses.size + 1
		@code = code
		@pegs = Pegs.new(code, game_state.secret_code)
	end

	def valid?
		check_size && check_colors
	end

	def win?
		@pegs.red == GameState::WIN_CONDITION
	end

		private 

	def check_size
		@code.size == GameState::CODE_LENGTH
	end

	def check_colors
		@code.all? { |c| GameState::COLORS.include?(c) }
	end

end