class Ai

	def initialize()
		@solutions =* (0000..5555).map{|n| "%04d" % n}
		@initial = true
	end

	def guess(guess, result)
		if(@initial) then 
			@initial = false
			return [$colors[0], $colors[0], $colors[1], $colors[1]].join
		else 
			case result[0]
			when 0
				guess_index = Logic.map_colors_to_index(guess).uniq
				
				guess_index.each{|x|
					@solutions.delete_if{|y|
						y.to_s.include?(x.to_s)
					}
				}
				#time for a code class?
				return Logic.map_index_to_colors([guess_index[0]+2, guess_index[0]+2, guess_index[1]+2, guess_index[1]+2])
			#when 1
			else return Logic.get_random_code().join
			end
		end
	end

end