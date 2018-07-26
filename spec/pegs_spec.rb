require 'pegs'

RSpec.describe Pegs do
	let(:pegs) {Pegs.new(guess_code, secret_code)}
	let(:guess_code) {['R','O','Y','G']}

	describe '#red' do 
		
		context'when no guesses are in the correct position' do
			let(:secret_code)  { ['B','B','B','B'] }
		
			it 'returns a value of zero' do				
		
				expect(pegs.red).to be 0
			end
		end
		
		context 'when 2 guesses are in the correct position' do
			let(:secret_code)  { ['R','G','Y','B'] }
		
			it 'returns a value of 2' do				
		
				expect(pegs.red).to be 2
			end
		end
		
		context 'when all values in guess match the values in secret' do
			let(:secret_code)  { guess_code }
		
			it 'returns a value of 4' do
		
				expect(pegs.red).to eq 4
			end
		end
	end	

	describe '#white' do
		
		context'when no guesses are the correct color, wrong position' do
			let(:secret_code)  { ['B','B','B','B'] }
		
			it 'returns a value of 0' do
		
				expect(pegs.white).to be 0
			end
		end
		
		context 'when 2 guesses are the correct color, wrong position' do
			let(:secret_code)  { ['R','Y','O','B'] }
		
			it 'returns a value of 2' do
		
				expect(pegs.white).to be 2
			end
		end
		
		context 'when all guesses are the correct color, wrong position' do
			let(:secret_code)  { ['O','G','R','Y'] }
		
			it 'returns a value of 4' do
		
				expect(pegs.white).to be 4
			end
		end

		context 'when all guesses match both location and color' do
			let(:secret_code)  { ['R','O','Y','G'] }
		
			it 'returns a value of 0' do
		
				expect(pegs.white).to be 0
			end
		end
	end
end

