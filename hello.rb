require "open-uri"
require("json") 

# Ask the user for their location.
puts "What's your location"

# Get and store the user's location.

user_location = gets.chomp

# Get the weather at the user's coordinates from the Pirate Weather API.
# Display the current temperature and summary of the weather for the next hour.
# For each of the next twelve hours, check if the precipitation probability is greater than 10%.
# - If so, print a message saying how many hours from now and what the precipitation probability is.
# -  If any of the next twelve hours has a precipitation probability greater than 10%, print "You might want to carry an umbrella!"

# If not, print "You probably won't need an umbrella today."

gmaps_key = ENV.fetch("GMAPS_KEY")

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

# take this gmaps url and put in the proper interpulations on hoppscotch.io - for example, if its Chicago itll be https://maps.googleapis.com/maps/api/geocode/json?address=Chicago&key=AIzaSyB92cYxPcYqgjwBJfWlwDQw_7yjuyU3tpA

puts gmaps_url

raw_gmaps_data = URI.open(gmaps_url).read

parsed_gmaps_data = JSON.parse(raw_gmaps_data)

# Get the user's latitude and longitude from the Google Maps API.

coordinates = parsed_gmaps_data.fetch("results").at(0)
.fetch("geometry").fetch("location")

lat = coordinates.fetch("lat")
long = coordinates.fetch("long")

pirate_weather_key
