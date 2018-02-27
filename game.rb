class Game
	@@colors = ["R", "G", "B", "Y", "P", "C"]
	

	def initialize()
		@code = get_random_code
		puts @code
	end

	private

	def get_random_code()
		code = Array.new(4, -1)

		code.each_with_index{ |v, i| 
			assigning = true
			while(assigning)
				num = rand(0..5)
				if(!code.include?(num)) then code[i] = num; assigning = false; end
			end
		}

		return code
	end

end