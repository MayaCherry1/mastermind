require 'past_guesses'
require 'guess'
require 'game_state'

RSpec.describe PastGuesses do 
	let(:past_guesses) { PastGuesses.new }
	let(:guess) { Guess.new(code, game_state) }
	let(:code) { ['R','O','Y','G'] }
	let(:game_state) { GameState.new }


	describe '#save_guess' do
		
		it 'adds a guess to the array of past guesses' do
			past_guesses.save_guess(guess)
			expect(past_guesses.size).to be 1
		end
	end

	describe '#size', 'returns the size of the array of past guesses.' do
		
		context 'When the object is initialized' do
			it 'returns 0.' do
				expect(past_guesses.size).to be 0
			end
		end
		
		context 'When there have been three objects added to the array' do
			it 'returns 3' do
				3.times {past_guesses.save_guess(guess)}
				expect(past_guesses.size).to be 3
			end
		end
	end

end