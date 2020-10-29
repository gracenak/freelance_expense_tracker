class UsersController < ApplicationController

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if user.save
            flash[:success] = "You have successfully signed up! Please log in."
            redirect '/login'
        else
            flash[:error] = "#{user.errors.full_messages.to_sentence}. Please try again."
            redirect "/signup"
        end
    end
    
    get '/login' do
        if logged_in?
            redirect "/gigs"    
        else
            erb  :"/users/login"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/gigs"
            binding.pry
        else
            flash[:error] = "Invalid credentials. Please try again"
            redirect "/login"
        end  
    end


    get '/logout' do
        if logged_in?
            session.clear
            flash[:message] = "You have successfully logged out. See you next time!"
            redirect "/"
        else
            redirect "/gigs"
        end
    end
end
