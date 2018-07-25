require 'past_guesses'
require 'guess'

RSpec.describe PastGuesses do 
	let(:past_guesses) { PastGuesses.new }

	describe '#save_guess' do
		
		it 'adds what is passed to it as an argument to a saved data structure' do
			past_guesses.save_guess('rrrr')
			past_guesses.save_guess('oooo')
			
			expect(past_guesses.size).to be 2
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
				3.times {past_guesses.save_guess('rrrr')}
				
				expect(past_guesses.size).to be 3
			end
		end
	end

	describe '#to_string' do

		context 'When the object is initialized' do
			it 'returns an empty array' do
			
				expect(past_guesses.to_string).to eq []
			end
		end
	end

end