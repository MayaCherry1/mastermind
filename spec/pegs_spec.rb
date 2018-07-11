require 'pegs'
require 'game_state'

RSpec.describe Pegs do
	let(:pegs) {Pegs.new(guess_code, game_state)}
	let(:guess_code) {['R','O','Y','G']}
	let(:game_state) {GameState.new}


	describe '#red' do 
		
		context'when no guesses are in the correct position' do
			it 'returns a value of zero' do
				allow(game_state).to receive (:secret_code)  { ['B','B','B','B'] }
				
				expect(pegs.red).to be 0
			end
		end
		
		context 'when 2 guesses are in the correct position' do
			it 'returns a value of 2' do
				allow(game_state).to receive (:secret_code)  { ['R','G','Y','B'] }
				
				expect(pegs.red).to be 2
			end
		end
		
		context 'when all values in guess match the values in secret' do
			it 'returns a value of 4' do
				allow(game_state).to receive (:secret_code)  { guess_code }

				expect(pegs.red).to eq 4
			end
		end
	end	

	describe '#white' do
		
		context'when no guesses are the correct color, wrong position' do
			it 'returns a value of 0' do
				allow(game_state).to receive (:secret_code)  { ['B','B','B','B'] }
				expect(pegs.white).to be 0
			end
		end
		
		context 'when 2 guesses are the correct color, wrong position' do
			it 'returns a value of 2' do
				allow(game_state).to receive (:secret_code)  { ['R','Y','O','B'] }
				expect(pegs.white).to be 2
			end
		end
		
		context 'when all guesses are the correct color, wrong position' do
			it 'returns a value of 4' do
				allow(game_state).to receive (:secret_code)  { ['O','G','R','Y'] }
				expect(pegs.white).to be 4
			end
		end

		context 'when all guesses match both location and color' do
			it 'returns a value of 0' do
				allow(game_state).to receive (:secret_code)  { ['R','O','Y','G'] }
				expect(pegs.white).to be 0
			end
		end
	end
end

