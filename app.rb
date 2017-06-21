# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/reloader" if development?

# ======= database =======
# set :database, "sqlite3:portfolio.db"  # sets the db name (will be created if it does not exist)
def db_maker
my_db = []
my_lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
formatted_lorem = my_lorem.gsub(/[.,]/,"").split
  (0..4).each do |i|
    user_data = {}
    counter = i * 5
    user_data[:id] = i+1  # {:id=>1}
    user_data[:fname] = formatted_lorem[counter]
    user_data[:lname] = formatted_lorem[counter+1]
    user_data[:uname] = formatted_lorem[counter+2]
    user_data[:password] = formatted_lorem[counter+3]
    user_data[:utype] = formatted_lorem[counter+4]
    my_db << user_data
    user_data = {}
  end
puts "\n*** my database ***"
puts my_db
end

product_catalogue = [
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil},
  {:prodid => nil, :prodname => nil, :price => nil, :image => nil}
]

# ======= home =======
get '/' do
  puts "\n******* home *******"
  erb :home
end

# ======= profile =======
get '/profile' do
  puts "\n******* profile *******"
  erb :profile
end

# ======= catalogue =======
get '/catalogue' do
  puts "\n******* catalogue *******"
  erb :catalogue
end

# ======= forms =======
get '/signinform' do
  puts "\n******* signinform *******"
  erb :signinform
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
