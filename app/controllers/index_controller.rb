class IndexController < ApplicationController
	
	def index
		@array = []
		for i in 0..6
			@array.push([0]*7)
		end
		@month = Date.today.strftime("%B")
		@year = Date.today.strftime("%Y")
		first_day = Date.today.at_beginning_of_month.strftime("%A")
		last_day = Date.today.end_of_month.strftime("%e").to_i
		day = 0
		case first_day
		when "Sunday"
			day = 0
		when "Monday"
			day = 1
		when "Tuesday"
			day = 2
		when "Wednesday"
			day = 3
		when "Thursday"
			day = 4
		when "Friday"
			day = 5
		when "Saturday"
			day = 6
		end

		week = 0
		diaActual = 1
		cont = 0
		
		for i in (0..@array.size-1)
			for j in (0..@array[i].size-1)
				if i == 0 and j < 5
					@array[i][j] = 0
				else				
					@array[i][j] = diaActual
					print "#{@array[i][j]}\s"
					diaActual +=1
				end
			end
			print "\n"
			if diaActual >= last_day then
				print "#{'entro'}"
				break
			end
		end
		cont = 0
		for i in(0..@array[4].size - 1)
			if @array[4][i] > last_day then
				@array[4][i] = (Date.today.at_beginning_of_month + (cont)).strftime("%e")
				cont +=1
			end
		end

		k = @array[0].size - 1
		cont = 0
		while k >= 0
			if @array[0][k] == 0 then
				@array[0][k] = (Date.today.prev_month.end_of_month - cont).strftime("%e")
				cont += 1
			end
			k -= 1
		end

	end
end

