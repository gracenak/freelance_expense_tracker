class UsersController < ApplicationController

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        if params[:username] != "" && params[:email] != "" && session[:id] = user.id
            redirect "/login"
        else
            erb :"users/signup"
        end
    end
    
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
            session[:user_id] = user.id
            redirect "/gigs"
        end  
    end


    get '/logout' do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/gigs"
        end
    end
end
