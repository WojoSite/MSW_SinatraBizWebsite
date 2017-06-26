# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require 'rainbow'
require 'geokit'

# ======= rainbow =======
puts "Who was the first president of the united states?"
answer = gets.chomp.downcase
if answer == "gw"
    puts Rainbow('That is the correct answer').yellow
else
    puts Rainbow('That is the wrong answer').red
end

# ======= geokit =======
address = Geokit::Geocoders::GoogleGeocoder.geocode '2101 New Hampshire Ave NW, Washington, DC'
puts "\naddress:\n#{address}"
address = Geokit::Geocoders::GoogleGeocoder.geocode '1 Windsor St, Andover, MA'
puts "\naddress:\n#{address}"

# ======= database =======
set :database, "sqlite3:portfolio.db"  # sets the db name (will be created if it does not exist)
# ======= home =======
get '/' do
  puts "\n******* home *******"
  erb :home
end

get '/home' do
  puts "\n******* home *******"
  erb :home
end

# ======= login =======
get '/signupform' do
  puts "\n******* login *******"
  erb :signupform
end

# ======= login =======
post '/signup' do
  puts "\n******* signup *******"
  @firstname = params[:firstname]
  @lastname = params[:lastname]
  @email = params[:email]
  puts params.inspect
  erb :profile # this will show after submit happens (make an erb profile page and isert it here)
end
