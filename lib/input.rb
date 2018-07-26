class Input

	def initialize(args = {})
		@input = args[:input] ||= ->{ STDIN.gets.chomp }
	end

	def get_user_input
		@input.call.upcase.tr(" ","")
	end

end