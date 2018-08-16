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
        erb :index, :layout => :layout_index
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
    flash[:info] = "You're all signed up. Create your first vibe."
    redirect "/"
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
    erb :create_post
end

post "/create-post" do
    if params[:post_body].length < 500
        @post = Post.create(
            title: params[:title],
            song_uri: params[:song_uri],
            post_body: params[:post_body],
        )

        @vibes_arr = params[:vibetag]
        @vibes_arr.each do |vb|
            @vibe_find = Vibe.find_by(name: vb).id
            @post_find = Post.find_by(title: params[:title]).id
            VibeConnection.create(
                vibe_id: @vibe_find,
                post_id: @post_find
            )
        end

        flash[:info] = "Success. Post added."
        redirect "/"
    else 
        flash[:warning] = "Your post body must be less than 500 characters."
        redirect "/create-post"
    end
end

get "/create-vibe" do
    @all_tags = Tag.all
    erb :create_vibe
end

post "/create-vibe" do
    @vibe = Vibe.create(
        name: params[:name],
        user_id: session[:user_id]
    )
    
    @tags_arr = params[:tagged]
    @tags_arr.each do |tg|
        @tag_id = Tag.find_by(name: tg).id
        @vibe_id = Vibe.find_by(name: params[:name]).id
        TagConnection.create(
            vibe_id: @vibe_id,
            tag_id: @tag_id
        )
    end    

    flash[:info] = "Success. Vibe created. Now add posts."
    redirect "/"
end

get '/users/:id/edit' do
    @current_user = User.find(params[:id])
    erb :edit_user
end

put '/users/:id' do 
    @current_user = User.find(params[:id])
    @current_user.update(first_name: params[:first_name], last_name: params[:last_name], password: params[:password], email: params[:email], blog_name: params[:blog_name], photo_url: params[:photo_url])

    flash[:info] = "Success. Your account has been updated."
    redirect '/'
end

delete '/users/:id' do 
    @current_user = User.find(params[:id])
    @current_user.destroy
    session[:user_id] = nil
    flash[:info] = "Peace. Your account has been deleted."
    redirect '/'
end