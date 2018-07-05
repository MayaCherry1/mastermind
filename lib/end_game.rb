class EndGame

	def win_game(secret, num_guesses)
		puts "\nCongratulations! The secret code was #{secret.join(" ")}"
		puts "You won in #{num_guesses} guesses"
	end

	def lose_game(secret)
		puts "\nYou lost. The secret code was #{secret.join(" ")}"
	end

	def print_msg(has_won, secret, num_guesses)
		if has_won
			win_game(secret,num_guesses)
		else
			lose_game(secret)
		end
	end
	
end