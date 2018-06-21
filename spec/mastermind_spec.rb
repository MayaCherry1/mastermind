require 'mastermind'


game = Mastermind.new

RSpec.describe Mastermind, "Print Directions" do

	it "prints game play instructions to console" do
		expect {game.print_directions}.to output(/To play:/).to_stdout 
	end

end

RSpec.describe SecretCode, "Generate" do 
	game = Mastermind.new
	it "generates a secret code that only includes valid colors" do
		secret_code = SecretCode.new
		code = secret_code.generate(game.colors)
		colors = game.colors
		pass = true

		code.each do |element| 
			if (!(colors.include?(element)))
				pass = false
			end
		end

		expect(pass).to eq(true)
	end

	it " generates a secret code of 4 colors" do

		secret_code = SecretCode.new
		code = secret_code.generate(game.colors)
		
		expect(code.size).to eq 4
	end

end

RSpec.describe UserGuess, "prompt_user_guess" do
	user = UserGuess.new

	it " prints number of guesses remaining to console" do
		expect {user.prompt_user_guess}.to output(/10/).to_stdout 
	end

	it " prompts user to enter guess" do
		expect {user.prompt_user_guess}.to output(/enter code/).to_stdout 
	end

end

RSpec.describe UserGuess, "check_size" do

		user = UserGuess.new

	it " returns true when the size of the array is four" do 
		code = ['a','b','c','d']
		expect(user.check_size(code)).to eq (true)
	end

	it "returns false when the size of the array is less than four" do
		code = ['a','b','c']
		expect(user.check_size(code)).to eq (false)

	end

	it "returns false when the size of the array is greater than four" do
		code = ['a','b','c','d','e']
		expect(user.check_size(code)).to eq (false)
	end
end









