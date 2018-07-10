require 'game_loop'

RSpec.describe GameLoop do
	let(:loop) {GameLoop.new}

	describe '#past_guesses' do
		it 'returns the past_guesses' do
			expect(loop.past_guesses).to eq([])
		end
	end

	describe '#fix_input' do
		let (:output) {['R', 'O', 'Y', 'G']}
		context('returns the input as an array of uppercase characters') do
			it 'when the input has spaces' do
				expect(loop.fix_input("R O Y G")).to eq (output)
			end
			it 'when the input has lowercase characters' do
				expect(loop.fix_input("royg")).to eq (output)
			end
			it 'when the input has spaces and mixed case characters' do
				expect(loop.fix_input("rO y G")).to eq (output)
			end
			it 'with leading and trailing whitespace' do
				expect(loop.fix_input("    royg    ")).to eq (output)
			end
		end
	end

end
