class GigsController < ApplicationController

    get '/gigs' do
        if logged_in?
            @gigs = Gig.all
            @user = current_user
            erb :"users/show"    
        else
            redirect "/login"    
        end
    end

    get '/gigs/:id' do
        @gig = Gig.find(params[:id])
        if logged_in?
            @user = current_user
            erb :"gigs/show"
        else
            redirect "/login"
        end
    end

end