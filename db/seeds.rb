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

		# binding.pry

		if state = State.find_by(name: capital[1])
			City.create(name: capital[0], state_id: state.id)
		end
	end
end



def create_canadian_states
	@states.each do |st|
		State.create(name: st[0], abbr: st[1], country_id: 1)
	end
end

def create_canadian_cities
	@canadian_cities.each do |cc|

		# binding.pry

		if state = State.find_by(name: cc[1])
			City.create(name: cc[0], state_id: state.id)
		end
	end
end

def main 
	create_countries
	create_us_states
	create_us_capitals
	create_canadian_cities
end

main
