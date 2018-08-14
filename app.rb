require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './models/user.rb'
require './models/post.rb'

Dir["./models/*.rb"].each {|file| require file }

enable :sessions

set :database, {adapter:'postgresql', database:'blog'}

get '/' do
    erb :index
end

get '/sign-in' do
    erb :sign_in
end

post '/sign-in' do
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:info] = "You have been signed in."
        redirect '/'
    else
        flash[:warning] = 'Your username or password is incorrect.'
        redirect '/sign-in'
    end
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
    @current_all_vibes = @current_user.vibes
    @current_vibe = Vibe.find(1)
    @vibe_posts = @current_vibe.posts
    erb :show_user
end



