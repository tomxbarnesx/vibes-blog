require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './models/user.rb'
require './models/post.rb'

Dir["./models/*.rb"].each {|file| require file }

enable :sessions

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
    erb :show_user
end

get "/sign-out" do
    session[:user_id] = nil
    flash[:info] = "You have been signed out."
    redirect "/"
end

get "/create-post" do
    @current_user = User.find(session[:user_id])
    @current_all_vibes = @current_user.vibes
    @all_tags = Tag.all
    erb :create_post
end

post "/create-post" do
    @post = Post.create(
        title: params[:title],
        song_uri: params[:song_uri],
        post_body: params[:post_body],
    )

    @vibe_connection = VibeConnection.create(
        post_id: :id,
        vibe_id: params[:vibe_id]
    )

    @tag_connection = TagConnection.create(
        post_id: :id,
        tag_id: params[:tag_id]
    )

    flash[:info] = "Success. Post added."
    redirect "/"
end

#NEEDS UPDATING —

get '/users/:id/edit' do
    @current_user = User.find(params[:id])
    erb :edit_user
end

delete '/users/:id' do 
    @current_user = User.find(params[:id])
    @current_user.destroy

    flash[:info] = "Peace. Your account has been deleted."
    redirect '/'
end