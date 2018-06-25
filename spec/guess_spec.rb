require 'guess'

RSpec.describe Guess do
	let(:guess) { Guess.new(id, code) }
	let(:id) { 4 }
	let(:code) { ['R', 'O', 'Y', 'G'] }
	let(:colors) { ['R' , 'O', 'Y', 'G', 'B', 'P'] }

	describe '#id' do
		it 'returns the id' do
			expect(guess.id).to be(id)
		end
	end

	describe '#code' do
		it 'returns the code' do
			expect(guess.code).to eq (code)
		end
	end

	describe '#valid?' do
		context 'when the size of the array is four' do
			it 'returns true' do
				expect(guess.valid?(colors)).to eq(true)
			end
		end

		context 'when the size is not four' do
			let(:code) { ['a'] }

			it 'returns false' do
				expect(guess.valid?(colors)).to eq(false)
			end
		end

		context 'when the code includes a character that is not in the given colors' do
			let(:code) { ['L','R','R','R'] }

			it 'returns false' do
				expect(guess.valid?(colors)).to eq(false)
			end
		end

	end
end