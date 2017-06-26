# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/reloader" if development?


# ======= database =======
# set :database, "sqlite3:portfolio.db"  # sets the db name (will be created if it does not exist)
# ======= home =======
get '/' do
  puts "\n******* home *******"
  erb :home
end

get '/home' do
  puts "\n******* home *******"
  erb :home
end

get '/about' do
  puts "\n******* home *******"
  erb :about
end

get '/gallery' do
  puts "\n******* home *******"
  erb :gallery
end

get '/contact' do
  puts "\n******* home *******"
  erb :contact
end
