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
    if session[:user_id]
        erb :signed_in_index
    else 
        erb :index
    end
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

get "/sign-up" do
    erb :sign_up
end
  
post "/sign-up" do
    if User.find_by(email: params[:email])
        flash[:warning] = "There is already an account attached to this email."
        redirect '/sign-up'
    elsif User.find_by(blog_name: params[:blog_name])
        flash[:warning] = "This blog name is already taken"
        redirect '/sign-up'
        #POTENTIALLY SUGGEST NEW ONES
    else
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            password: params[:password],
            email: params[:email],
            birthday: params[:birthday],
            blog_name: params[:blog_name],
            photo_url: params[:photo_url],    
        )
    session[:user_id] = @user.id
    flash[:info] = "You're all signed up. Login in to create your first vibe."
    redirect "/sign-in"
    end
end
    

get '/users' do
    @all_users = User.all
    erb :users
end

get '/users/:id' do
    @current_user = User.find(params[:id])
    @current_all_vibes = @current_user.vibes
    @current_vibe = Vibe.find(1)
    @vibe_posts = @current_vibe.posts
    erb :show_user
end

get "/sign-out" do
    session[:user_id] = nil
    flash[:info] = "You have been signed out."
    redirect "/"
end
