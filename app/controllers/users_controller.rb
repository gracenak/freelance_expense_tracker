class UsersController < Sinatra::Base

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
            redirect "/account"
        else
            erb :"users/login"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/account"
        end  
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/account"
        end
    end

    get '/account' do
        if logged_in?
            @gigs = Gig.all
            @user = current_user
            erb :"users/show"    
        else
            redirect "/login"    
        end
    end
end
