class Code
	attr_accessor :combination

	#Stored as a string of 4 characters
	#If no code is provided a random one is assigned
	def initialize(code = nil)
		if code.nil? then code = Logic.get_random_code().combination end

		code = code.join("") unless !code.is_a?(Array)

		Logic.check_entry(code) ? @combination = code : @combination = nil
	end

end