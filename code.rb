class Code
	attr_accessor :combination

	#Stored as a string of 4 characters
	#If no code is provided a random one is assigned
	def initialize(code = nil)
		if code.nil? then code = get_random_code end

		code = code.join("") unless !code.is_a?(Array)

		check_entry(code) ? @combination = code : @combination = nil
	end

	def check_entry(code)
		if((code =~ /^[RGBYPC]{4}$/) != nil) then 
			return true
		else return false
		end
	end

	def get_random_code()
		code = Array.new(4, -1)

		code.each_with_index{|v, i|
			code[i] = $colors[rand(0..5)]
		}

		return code
	end
end