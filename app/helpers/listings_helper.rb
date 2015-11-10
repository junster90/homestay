module ListingsHelper
	BEDROOMS = ["1",'2','3','4','5','6','7','8','9','10']

	BEDS = ["1",'2','3','4','5','6','7','8','9','10','11','12','13','14','15','16',"16+"]

	BATHROOMS = ['0', '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5', '5', '5.5', '6', '6.5', '7', '7.5', '8+']

	HOMETYPES = ["Apartment", 'House', 'Bed & Breakfast', 'Loft', 'Townhouse', 'Condominium', 'Bungalow', 'Cabin', 'Villa', 'Castle', 'Dorm', 'Treehouse', 'Boat', 'Plane', 'Camper/RV', 'Igloo', 'Lighthouse', 'Yurt', 'Tipi', 'Cave', 'Island', 'Chalet', 'Earth House', 'Hut', 'Train', 'Tent', 'Other']

	ROOMTYPES = ['Entire home/apt', 'Private room', 'Shared room']

	MAX_GUESTS = ["1",'2','3','4','5','6','7','8','9','10','11','12','13','14','15','16',"16+"]

	def countries_list
		list = []
		countries = Country.all
		countries.each do |c|
			list << c.name
		end
		list.sort
	end
end
