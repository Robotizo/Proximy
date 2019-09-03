class Location < ApplicationRecord



	R = 6371000



	def getDistance
		lat1 = 49.939968
		lon1 = -119.395898

		dLat = deg2rad(self[:latitude]-lat1)
		dLon = deg2rad(self[:longitude]-lon1)

		a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(self[:latitude])) * Math.sin(dLon/2) * Math.sin(dLon/2)
		c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
		d = R * c
		return d
	end


	def deg2rad(deg) 
    	return deg * (Math::PI/180)
	end





	def sumNum(locationID)
		location = Location.find_by_id(locationID)
		num = location.itself[:number] + self[:number]
		return num
	end




	

	



end
