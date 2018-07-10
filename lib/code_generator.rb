class CodeGenerator

	def self.generate (game_state)
		4.times.map { |c| game_state.COLORS.sample }
	end

end