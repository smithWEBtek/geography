require_relative './states.rb'
require_relative './capitals.rb'
require_relative './canadian_cities.rb'

def create_countries
	Country.create(name: 'USA')
	Country.create(name: 'Canada')
end

def create_us_states
	@states.each do |st|
		State.create(name: st[0], abbr: st[1], country_id: 1)
	end
end

def create_us_capitals
	@capitals.each do |capital|
		if state = State.find_by(name: capital[1])
			City.create(name: capital[0], state_id: state.id)
		end
	end
end

def create_canadian_states
	@canadian_cities.each do |city|
		State.find_or_create_by(name: city[1], abbr: "cc", country_id: 2)
	end
end

def create_canadian_cities
	@canadian_cities.each do |city|
		if state = State.find_by(name: city[1])
			City.find_or_create_by(name: city[0], state_id: state.id)
		end
	end
	canadian_cities_count = City.all.collect{|c| c.state.country_id == 2}.count
	puts `There are #{canadian_cities_count} Canadian cities added.`
end

def main 
	create_countries
	create_us_states
	create_us_capitals
	create_canadian_states
	create_canadian_cities
end

main
