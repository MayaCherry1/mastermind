class Guess

	attr_reader :id, :code

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

end