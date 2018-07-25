require 'game_state'
require 'game_loop'
require 'ui_controller'

RSpec.describe GameLoop do
	let(:game) { GameLoop.new(ui,gs) }
	let(:ui) { UIController.new }
	let(:gs) {GameState}

	describe "#play" do
		
		xit "results in a win if the secret is guessed" do
			allow(ui).to receive(:new_game_message) {nil}
			allow(ui).to receive(:display_game_dialog) {nil}
			allow(ui).to receive(:get_user_input) {'RRRR'}
			allow(ui).to receive(:game_over) {nil}
			allow(ui).to receive(:play_again?) {false}
			allow(ui).to receive(:exit_game) {nil}
			
			game.play

			expect(game_state.has_won).to eq true
		end

		xit "results in a loss if the secret is not guessed" do
			allow(game).to receive(:display_game_dialog) {nil}
			allow(input).to receive(:get_user_input) { ['Y','Y','O','O'] }
			allow(game_state).to receive (:secret_code)  { ['R','R','R','R'] }
			
			game.play

			expect(game_state.has_won).to eq false
		end
	end
end