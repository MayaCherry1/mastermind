require 'game_setup'


RSpec.describe GameSetup do
	let(:game) { GameSetup.new }
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

	describe '#title' do
		it "returns game play title" do
			expect (game.title).should include("Welcome")
		end
	end

	describe '#directions' do
		it "returns game play instructions" do
			expect (game.directions).should include("To play:")
		end
	end
end
