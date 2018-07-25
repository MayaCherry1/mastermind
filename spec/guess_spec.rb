require 'guess'
require 'game_state'

RSpec.describe Guess do
	let(:guess) { Guess.new(code, game_state) }
	let(:game_state) {GameState.new}
	let(:code) { ['R', 'O', 'Y', 'G'] }

	describe '#id' do
		
		it 'returns the id of a guess, first should be 1' do
		
			expect(guess.id).to eq 1
		end
	end

	describe '#code' do
		
		it 'returns the code' do
		
			expect(guess.code).to eq code
		end
	end

	describe '#pegs' do
		
		it 'returns an object of the Pegs class' do
		
			expect(guess.pegs.class).to eq Pegs
		end

		context 'when guessed color in the correct position, and two that are in the wrong position' do
			
			it 'has one red peg' do
				allow(game_state).to receive(:secret_code) { ['R','Y','O','B'] }
		
				expect(guess.pegs.red).to eq 1
			end

			it 'has two white pegs' do
				allow(game_state).to receive(:secret_code) { ['R','Y','O','B'] }
		
				expect(guess.pegs.white).to be 2
			end	
		end
	end

	describe '#valid?' do
		
		context 'when the size of the array is four' do
			it 'returns true' do
		
				expect(guess.valid?).to eq true
			end
		end

		context 'when the size is not four' do
			let(:code) { ['R'] }
			
			it 'returns false' do
				expect(guess.valid?).to eq false
			end
		end

		context 'when the code includes a character that is not in the given colors' do
			let(:code) { ['L','R','R','R'] }

			it 'returns false' do
				expect(guess.valid?).to eq false
			end
		end

	end

	describe "#is_win?" do

		context 'when guessed code matches secret' do
			let(:code) { game_state.secret_code }
			
			it 'returns true' do
				expect(guess.win?).to eq true
			end
		end

		context 'when guessed code does not match secret' do
			let(:code) { ['L','L','L','L'] }

			it 'returns false' do
				expect(guess.win?).to eq false
			end
		end

		context 'when all colors are correct, but in wrong positions' do
			let(:code) { ['O', 'R', 'G', 'Y']}
			it 'returns false' do
		
				expect(guess.win?).to eq false
			end
		end

	end
end