require 'code_generator'

RSpec.describe CodeGenerator do
	let(:secret) { CodeGenerator.new }
	let(:colors) { ['R' , 'O', 'Y', 'G', 'B', 'P'] }
	
	describe '#generate' do	
		let(:code) {secret.generate(colors)}

		it 'generates a secret code of 4 colors' do
			code = secret.generate(colors)
		
			expect(code.size).to be 4
		end
		
		it "generates a secret code that only includes valid colors" do
			expect(colors).to include(*code);
		end
	end
end