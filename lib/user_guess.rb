Class UserGuess
	
	def prompt_user_guess
		print %{Remaining guesses: #{remaining_guesses}\nPlease enter code [x x x x]: }
		input = STDIN.gets
		input.split(" ")
	end

	def check_size(guess)
		pass = true
		if (guess.size != 4) 
			puts ("INVALID INPUT: Please enter four colors")
			pass = false
		end
		pass
	end

	def check_colors(colors, guess)
		pass = true
		guess.each do |element| 
			if (!(colors.include?(element)))
				puts ("INVALID INPUT: Please enter only the first letter of the colors you wish to guess")
				pass = false
			end
		end
		pass
	end

end