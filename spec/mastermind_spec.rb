require 'mastermind'

RSpec.describe GameSetUp, "Set up game" do

	game_setup = GameSetUp.new

		it "prints game play instructions to console" do
			expect {mastermind_game.print_directions}.to output(/To play:/).to_stdout 
		end

		it "generates secret code only includes valid colors" do
			code = mastermind_game.generate_code
			colors = mastermind_game.colors
			pass = true

			code.each do |element| 
				if (!(colors.include?(element)))
					pass = false
				end
			end

			expect(pass).to eq(true)
		end

		it " generates a secret codea of 4 colors" do

			code = mastermind_game.generate_code
			
			expect(code.size).to eq 4
		end

	end


	RSpec.describe PlayGame
		play = GamePlay.new

		it " prints number of guesses remaining to console" do
			expect {play.prompt_user_guess}.to output(/#{play.remaining_guesses}/).to_stdout 
		end

		it " prompts user to enter guess" do
			expect {play.prompt_user_guess}.to output(/enter code/).to_stdout 
		end

		xit "reads user's guess" do

		end

		xit "program counts the number of guesses the user submits" do

		end

	end

end


