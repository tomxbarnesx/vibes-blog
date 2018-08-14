require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

require './models/user.rb'
require './models/post.rb'

Dir["./models/*.rb"].each {|file| require file }

enable :sessions

set :database, {adapter:'postgresql', database:'blog'}

get '/' do
    erb :index
end

get '/users' do
    @all_users = User.all
    erb :users
end

get '/users/new' do
    erb :new_user
end

get '/users/:id' do
    @current_user = User.find(params[:id])
    @all_vibes = @current_user.vibes
    erb :show_user
end



