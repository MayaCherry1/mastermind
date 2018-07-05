class EndGame

	def initialize (num_guesses, secret)
		if num_guesses  10
			game_lose(secret)
	end

	def game_win (num_guesses, secret)
		puts "Congratulations! The secret code was #{secret.join(" ")}"
		puts "You won in #{num_guesses} guesses"
	end

	def game_lose(secret)
		puts "You lost. The secret code was #{secret.join(" ")}"
		puts "Thanks for playing!"
	end
	
end