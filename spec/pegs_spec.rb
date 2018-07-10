require 'pegs'

RSpec.describe Pegs do
	let(:pegs) {Pegs.new(secret,guess)}
	let(:secret) {['R','O','Y','G']}
	let(:guess) {['R','O','Y','G']}


	describe '#check_red' do 
		context'when no guesses are in the correct position' do
			let(:guess){['Y','R','O','Y']}
			it 'leaves the guess array unchanged' do
				pegs.check_red
				expect(pegs.guess).to eq (guess)
			end
			it 'leaves the secret array unchanged' do
				pegs.check_red
				expect(pegs.secret).to eq (secret)
			end
		end
		context 'when some guesses are in the correct position' do
			let(:guess) {['R','Y','G','P']}
			it 'changes any positions in guess that are same color same position to a \'.\'' do
				pegs.check_red
				expect(pegs.guess).to eq (['.', 'Y', 'G', 'P'])
			end
			it 'changes any positions in secret that are same color same position to a \'+\'' do
				pegs.check_red
				expect(pegs.secret).to eq ['+', 'O', 'Y', 'G']
			end
		end
		context 'when all values in guess match the values in secret' do
			let(:guess) {['R','O','Y','G']}
			it 'changes all positions in guess to \'.\'' do	
				pegs.check_red
				expect(pegs.guess).to eq (['.', '.', '.', '.'])
			end
			it 'changes all positions in secret to \'+\'' do	
				pegs.check_red
				expect(pegs.secret).to eq ['+', '+', '+', '+']
			end
		end
	end	

	describe '#white_pegs' do
		context'when no guesses are in the correct color' do
			let(:guess){['P','P','P','P']}
			it 'leaves the guess array unchanged' do
				pegs.check_white
				expect(pegs.guess).to eq (guess)
			end
			it 'leaves the secret array unchanged' do
				pegs.check_white
				expect(pegs.secret).to eq (secret)
			end
		end
		context 'when some guesses are the correct color' do
			let(:guess) {['O','R','P','P']}
			it 'changes any positions in guess that are right color wrong position to \'.\'' do
				pegs.check_white
				expect(pegs.guess).to eq (['.', '.', 'P', 'P'])
			end
			it 'changes any positions in secret that have been matched to \'-\'' do
				pegs.check_white
				expect(pegs.secret).to eq ['-', '-', 'Y', 'G']
			end
		end
		context 'when all values in guess match the values in secret' do
			let(:guess) {['Y','G','R','O']}
			it 'changes all positions in guess to \'.\'' do	
				pegs.check_white
				expect(pegs.guess).to eq (['.', '.', '.', '.'])
			end
			it 'changes all positions in secret to \'-\'' do	
				pegs.check_white
				expect(pegs.secret).to eq ['-', '-', '-', '-']
			end
		end
	end

	describe '#count_red' do
		context 'when two items have been matched' do
			let(:secret) {['R','-','+','+']}
			it 'returns 2' do
				expect(pegs.count_red).to be 2
			end
		end
		context 'when all items match' do
			let(:secret) {['+','+','+','+']}
			it 'returns 4' do
				expect(pegs.count_red).to be 4
			end
		end
		context 'when no items match' do
			let(:secret) {['R','O','Y','G']}
			it 'returns 0' do
				expect(pegs.count_red).to be 0
			end
		end
	end

	describe '#count_white' do
		context 'when two items have been matched' do
			let(:secret) {['R','-','-','+']}
			it 'returns 2' do
				expect(pegs.count_white).to be 2
			end
		end
		context 'when all items match' do
			let(:secret) {['-','-','-','-']}
			it 'returns 4' do
				expect(pegs.count_white).to be 4
			end
		end
		context 'when no items match' do
			let(:secret) {['R','O','Y','G']}
			it 'returns 0' do
				expect(pegs.count_white).to be 0
			end
		end
	end

end

