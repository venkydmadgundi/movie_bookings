# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

slots_price = {7=>100,10=>150,13=>200,16=>250,19=>250,22=>200}

days = [Time.now.yesterday.day,Time.now.day,Time.now.tomorrow.day]

movies = Movie.create([	{ name: "Ghost Stories",director_name:"Karan Johar, Dibakar Banerjee, Zoya Akhtar, Anurag Kashyap", release_date: Date.today.yesterday, is_active: true}, 
	{ name: "Bhangra Paa Le",director_name:"Sneha Taurani", release_date: Date.today - 2.day, is_active: true},
	{ name: "Sab Kushal Mangal",director_name:"Karan Vishwanath Kashyap", release_date: Date.today - 3.day, is_active: false},
	{ name: "Shimla Mirchi",director_name:"Ramesh Sippy", release_date: Date.today - 4.day, is_active: true},
	{ name: "Tanhaji", director_name:"Om Raut", release_date: Date.today - 5.day, is_active: true},
	{ name: "Chhapaak", director_name: "Meghna Gulzar", release_date: Date.today - 6.day, is_active: false},
	{ name: "Jai Mummy Di",director_name: "Navjot Gulati", release_date: Date.today - 7.day, is_active: false},
	{ name: "Street Dancer 3D",director_name: "Remo D'Souza", release_date: Date.today - 8.day, is_active: true},
	{ name: "Panga",director_name: "Ashwiny Iyer Tiwari", release_date: Date.today - 9.day, is_active: true},
	{ name: "Happy Hardy and Heer",director_name:"Raka", release_date: Date.today - 10.day, is_active: true}])

theatres = Theatre.create!([{name: 'E-Square', seats: 50},
	{name: 'Big Cinema', seats: 75},
	{name: 'PVR Cinema', seats: 80},
	{name: 'INOX Theater', seats: 65},
	{name: 'Ashoka Talkies', seats: 70}])

def get_show_time(show_hour)
	case show_hour
	when 0..11 then "Morning"
	when 12..15 then "Afternoon"
	when 16..20 then "Evening"
	when 21..23 then "Night"
	end
end

Theatre.all.each do |theatre|
	index = 0
	slots_price.each do |slot, price|
		index 		= 0 if index == 3
		start_at 	= Time.new(Time.now.year, Time.now.month, days[index],slot,0)
		end_at 		= Time.new(Time.now.year, Time.now.month, days[index],slot+2,0)
		timing 		= Timing.create({start_time: start_at, end_time: end_at, name: get_show_time(start_at.strftime("%H").to_i)})
		Movie.active.each do |movie|		
			Show.create!(movie: movie, theatre: theatre, timing: timing, seat_price: price, show_date:  start_at.strftime("%d-%m-%Y"), available_seats: theatre.seats - 1 )
		end
		index += 1
	end
end

