class UsersController < ApplicationController

    #render signup form
    get '/signup' do
        erb :"users/signup"
    end

    #receive the data [params] from the signup form
    post '/signup' do
        user = User.create(params)
        if params[:username] != "" && params[:email] != "" && session[:id] = user.id
            redirect "/login"
        else
            flash[:error] = "Invalid credentials. Please try again"
            redirect "/signup"
        end
    end
    
    #render login form
    get '/login' do
        if logged_in?
            redirect "/gigs"    
        else
            erb :"users/login"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            #creating a key/value pair in the sessions hash using the users id to log them in
            session[:user_id] = user.id
            redirect "/gigs"
        else
            flash[:error] = "Invalid login credentials. Please try again!"
            redirect "/login"
        end  
    end


    get '/logout' do
        if logged_in?
            session.clear
            redirect "/"
        else
            redirect "/gigs"
        end
    end
end
