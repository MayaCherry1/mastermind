class Input

	def initialize(args = {})
		@input = args[:input] ||= ->{ STDIN.gets.chomp }
	end

	def continue
		@input.call
	end

	def get_user_guess
		@input.call.upcase.tr(" ","").chars
	end

	def play_again
		@input.call.downcase.tr(" ","")
	end

end