require 'mastermind'


RSpec.describe Mastermind do
	let(:game) { Mastermind.new }
	let(:colors) { ['R' , 'O', 'Y', 'G', 'B', 'P'] }

	describe '#colors' do
		it 'returns the colors array' do
			expect(game.colors).to eq (colors)
		end
	end

	describe '#secret_code' do
		it 'returns an empty array when initialized' do
			expect(game.secret_code.class).to eq (Array)
		end
	end

	describe '#secret_code' do
		it 'can be changed' do
			game.secret_code = ['A', 'B', 'C', 'D']
			expect(game.secret_code).to eq (['A', 'B', 'C', 'D'])
		end
	end

	describe '#print_directions' do
		it "prints game play instructions to console" do
			expect {game.print_directions}.to output(/To play:/).to_stdout 
		end
	end
end

RSpec.describe CodeGenerator do
	let(:secret) { CodeGenerator.new }
	let(:colors) { ['R' , 'O', 'Y', 'G', 'B', 'P'] }
	
	describe '#generate' do	
		let(:code) {secret.generate(colors)}

		it 'generates a secret code of 4 colors' do
			code = secret.generate(colors)
		
			expect(code.size).to be 4
		end
		
		it "generates a secret code that only includes valid colors" do
			expect(colors).to include(*code);
		end
	end
end

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

	RSpec.describe



end
