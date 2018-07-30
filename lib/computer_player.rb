require_relative './game_state'
require_relative './pegs'

class ComputerPlayer

	COMBOS = GameState::COLORS.repeated_permutation(4).to_a
	GUESS_LIMIT = 10
	INITIAL_GUESS = ['R','R','O','O']

	def initialize(pegs = Pegs, guess_holder = Guess)
		@possible_combos = COMBOS
		@pegs = pegs
		@guess_holder = guess_holder
		@secret = COMBOS.sample
		@game_state = GameState.new
	end

	def play
		guess_number = 1
		guess = new guess_holder(INITIAL_GUESS, game_state)
		while game_state.remaining_guesses > 0
			pegs = @pegs.new(guess, @secret)
			update_combos(guess)
			check_win(guess)
			guess = new_guess
			puts "\n#{guess.id}: #{guess.code}"
			p @possible_combos
			p @possible_combos.size
		end
		puts "You lose. #{guess}"
	end

	def update_combos(guess)
		@possible_combos.select! do |code| 
			temp = guess_holder.new(code, game_state)
			guess.pegs.red == temp.pegs.red && guess.pegs.white == temp.pegs.white
		end
	end

	def check_win(guess)
		if guess.win?
			print_win_message(guess) 
			exit 
		end
	end

	def new_guess
		guess_holder.new(@possible_combos.sample, @game_state)
	end

	def print_win_message(guess)
		puts "You Win! #{guess} : #{@secret}"
	end
end

comp = ComputerPlayer.new
comp.play