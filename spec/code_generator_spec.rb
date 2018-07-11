require 'code_generator'

RSpec.describe CodeGenerator do

	describe '#generate' do	
		let(:code) {CodeGenerator.generate}

		it 'generates a secret code of 4 elements' do
			expect(code.size).to be 4
		end
		
		it "generates a secret code that only includes valid colors" do
			colors = ['R','O','Y','G','B','P']
			expect(colors).to include(*code);
		end
	end
end