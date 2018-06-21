class SecretCode

	generate (colors)
		secret_code = []
		4.times do |i|
			secret_code << colors.sample
		end
		secret_code
	end

end