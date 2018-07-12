require 'game_state'
require 'game_loop'
require 'input'

RSpec.describe GameLoop do
	let(:game) { GameLoop.new(game_state, input) }
	let(:input)	{ Input.new}
	let(:game_state) { GameState.new }


	describe "#play" do
		it "results in a win if the secret is guessed" do
			allow(game).to receive(:display_game_dialog) {nil}
			allow(input).to receive(:get_user_guess) { game_state.secret_code }
			
			game.play

			expect(game_state.has_won).to eq(true)
		end

		it "results in a loss if the secret is not guessed" do
			allow(game).to receive(:display_game_dialog) {nil}
			allow(input).to receive(:get_user_guess) { ['Y','Y','O','O'] }
			allow(game_state).to receive (:secret_code)  { ['R','R','R','R'] }
			
			game.play

			expect(game_state.has_won).to eq(false)
		end
	end
end


	# describe '#format_input' do
	# 	let (:output) {['R', 'O', 'Y', 'G']}
	# 	context('returns the input as an array of uppercase characters') do
	# 		it 'when the input has spaces' do
	# 			expect(loop.format_input("R O Y G")).to eq (output)
	# 		end
	# 		it 'when the input has lowercase characters' do
	# 			expect(loop.format_input("royg")).to eq (output)
	# 		end
	# 		it 'when the input has spaces and mixed case characters' do
	# 			expect(loop.format_input("rO y G")).to eq (output)
	# 		end
	# 		it 'with leading and trailing whitespace' do
	# 			expect(loop.format_input("    royg    ")).to eq (output)
	# 		end
	# 	end
	# end