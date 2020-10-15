class GigsController < Sinatra::Base

    get '/gigs' do
        if logged_in?
            @gigs = Gig.all
            @user = current_user
            erb :"users/show"    
        else
            redirect "/login"    
        end
    end

end