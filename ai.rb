class Ai

	def initialize()
		@solutions = $colors.repeated_permutation(4).to_a
		@initial = true
	end

	def guess(guess, result)
		if(@initial) then 
			@initial = false
			return Code.new("RRGG")
		else 
			case result[0]
			when 0
				guess.combination.split("").each{|x|
					@solutions.delete_if{|y|
						y.include?(x)
					}
				}
				next_guess = [$colors[$colors.index(guess.combination[0])+2],$colors[$colors.index(guess.combination[1])+2],$colors[$colors.index(guess.combination[2])+2],$colors[$colors.index(guess.combination[3])+2]].join
				return Code.new(next_guess)
			else return Code.new()
			end
		end
	end

end