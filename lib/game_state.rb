require_relative './code_generator'
require_relative './guess'
require 'json'

class GameState

	COLORS = ['R' , 'O', 'Y', 'G', 'B', 'P']
	WIN_CONDITION = 4
	GUESS_LIMIT = 10
	CODE_LENGTH = 4


	attr_accessor :has_won
	attr_reader :secret_code, :past_guesses
		
	def initialize(sc = CodeGenerator, g = Guess)
		@has_won = false
		@past_guesses = []
		@secret_code = sc.generate
		@g = Guess
		
	end

	def remaining_guesses
		GUESS_LIMIT - past_guesses.size
	end

	def save_guess(guess)
		past_guesses << guess
	end

	def save_state
		current_state = { 
			:has_won => @has_won, 
			:secret_code => @secret_code,
			:past_guesses => @past_guesses.map { |g| g.code}
		}
		File.open("saved_game.json","w") do |f|
			f.write(current_state.to_json)
		end
	end

	def restore_state
		file = File.read('saved_game.json')
		desired_state = JSON.parse(file)
		@has_won = desired_state['has_won']
		@secret_code = desired_state['secret_code']
		past_guesses = []
		temp_guesses = desired_state['past_guesses']
		temp_guesses.map { |c| save_guess(@g.new(c, self))}
	end
end