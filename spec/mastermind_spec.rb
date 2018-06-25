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




