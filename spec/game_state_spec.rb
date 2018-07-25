require 'game_state'

RSpec.describe GameState do
	let(:game_state) {GameState.new}

	describe '#COLORS' do
		
		it 'returns the array of possible colors' do
	
			expect(GameState::COLORS).to eq ['R' , 'O', 'Y', 'G', 'B', 'P']
		end
	end

	describe '#WIN_CONDITION' do
		
		it 'returns the number of red pegs needed to win' do
	
			expect(GameState::WIN_CONDITION).to be 4
		end
	end

	describe '#GUESS_LIMIT' do
		
		it 'returns the number of chances the user has to guess the secret code' do
	
			expect(GameState::GUESS_LIMIT).to be 10
		end
	end

	describe '#CODE_LENGTH' do
		
		it 'returns the number of characters in the secret code' do
		
			expect(GameState::CODE_LENGTH).to be 4
		end
	end

	describe '#has_won' do
		
		it 'returns whether or not the user has won, initailized to false' do
		
			expect(game_state.has_won).to eq false
		end
	end

	describe '#past_guesses' do
		
		it 'returns a PastGuess obeject' do
			
			expect(game_state.past_guesses.class).to eq PastGuesses
		end
	end

	describe '#secret_code' do
		
		it 'returns an array' do
			
			expect(game_state.secret_code.class).to eq Array
		end
	end

	describe 'remaining_guesses' do

		it 'returns the number of the guesses that the user has left, starts at 10' do
	
			expect(game_state.remaining_guesses).to be 10
		end

		it 'decreases the number of guesses remainging when guesses are added to past_guesses' do
			game_state.past_guesses.save_guess(['R','O','Y','G'])
			
			expect(game_state.remaining_guesses).to be 9
		end
	end

end


