require_relative './game_state'

module CodeGenerator

	def self.generate
		GameState::CODE_LENGTH.times.map { |c| GameState::COLORS.sample }
	end
	
end