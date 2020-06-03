require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/film')

also_reload('./models/*')

get '/' do
    erb( :home )
end
get '/all_movies' do
    @films = Film.all
    erb(:all_movies)
end
get '/about-us' do
    erb( :about_us )
end
