require "dotenv"
require "json"
require "open-uri"
require "pp"

Dotenv.load

BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
API_KEY = ENV["API_KEY"]

response = open(BASE_URL + "?zip=160-0004,JP&APPID=#{API_KEY}")
weather_string = JSON.pretty_generate(JSON.parse(response.read))
forecast = JSON.parse(weather_string, symbolize_names: true)
forecast[:list].each do |x|
  puts Time.at(x[:dt])
  puts x[:main][:pressure]
  puts "---------------------"
end