require 'game_loop'

RSpec.describe GameLoop do
	let(:loop) {GameLoop.new}
	let(:colors) { ['R' , 'O', 'Y', 'G', 'B', 'P'] }

	describe '#past_guesses' do
		it 'returns the past_guesses' do
			expect(loop.past_guesses).to eq([])
		end
	end

	describe '#format_input' do
		let (:output) {['R', 'O', 'Y', 'G']}
		context('returns the input as an array of uppercase characters') do
			it 'when the input has spaces' do
				expect(loop.format_input("R O Y G")).to eq (output)
			end
			it 'when the input has lowercase characters' do
				expect(loop.format_input("royg")).to eq (output)
			end
			it 'when the input has spaces and mixed case characters' do
				expect(loop.format_input("rO y G")).to eq (output)
			end
			it 'with leading and trailing whitespace' do
				expect(loop.format_input("    royg    ")).to eq (output)
			end
		end
	end

	describe "#loop_guesses" do
		it "results in a win if the secret is guessed" do
			allow(loop).to receive(:get_user_input) { "OOOO" }

			loop.loop_guesses(colors, ['O', 'O', 'O', 'O'])

			expect(loop.has_won).to eq(true)
		end

		it "results in a win if the secret is guessed" do
			allow(loop).to receive(:get_user_input) { "YYYY" }

			loop.loop_guesses(colors, ['O', 'O', 'O', 'O'])

			expect(loop.has_won).to eq(false)
		end
	end
end


class Dialog

	def initialize(args = {})
		@output = args[:output] ||= ->(string) { puts string }
	end

	def welcome(name)
		@output.call "Welcome #{name}!"
	end

	def directions
		@output.call """\nTo play: The computer will generate a four character color code of the following 
		colors Red (R), Orange (O), Yellow (Y), Green (G), Blue (B), Purple (P). You will try to
		guess the code by writing a sequence of four uppercase letters, each representing
		a color. Colors can be repeated and order does matter in the sequence. The computer
		will return feedback in the form of pegs: red meaning that a color exists in the
		secret code and is in the correct location; white meaning that the color is in the 
		secret code but is in the wrong location. You will have ten guesses.

		Additional commands:
		/help	: to print the instructions
		/restart: to generate a new game
		/quit   : to quit the game\n\n"""
	end
end



dialog = Dialog.new
dialog.welcome

dialog = Dialog.new(output: ->(x) { HTTP.send(x) })
dialog.welcome

Dialog.new()
