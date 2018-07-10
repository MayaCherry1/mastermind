class PastGuesses

	def initialize
		@past_guesses = []
	end

	def save_guess(guess)
		@past_guesses << (guess)
	end

	def size
		@past_guesses.size
	end

	def to_string
		@past_guesses.map { |g| "#{g.id}: #{g.code.join(" ")}\t red: #{g.pegs.red}  white: #{g.pegs.white}\n"}
	end

end