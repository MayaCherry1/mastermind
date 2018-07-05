require_relative './feedback'

class Guess

	attr_reader :id, :code, :red, :white, :feedback

	def initialize (id, code)
		@id = id
		@code = code
	end

	def valid? (colors)
		check_size && check_colors(colors)
	end

	def check_size
		@code.size == 4 
	end

	def check_colors (colors)
		@code.all? { |c| colors.include?(c) }
	end

	def set_feedback(secret)
		@feedback = Feedback.new(secret,@code).generate
	end

end