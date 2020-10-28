class GigsController < ApplicationController

    get '/gigs' do
        if logged_in?
            @user = current_user
            erb :"gigs/index"  
        else
            redirect "/"    
        end
    end

    get '/gigs/new' do
        if logged_in?
            @user = current_user
            erb :"gigs/new"
        else
            flash[:warning] = "You must be logged in to create a gig. Please log in!"
            redirect "/login"
        end
    end

    post '/gigs' do
        @user = current_user
        @gig = Gig.new(employer: params[:employer], date: params[:date], description: params[:description], payment: params[:payment], expenses: params[:expenses])
        if @gig.save
            @user.gigs << @gig
            flash[:message1] = "Your gig has been successfully created!"
            redirect "/gigs/#{@gig.id}"
        else
            flash[:error] = "Gig creation failed. #{@gig.errors.full_messages.to_sentence}"
            redirect "/gigs/new"
        end
    end

    get '/gigs/:id' do
        if logged_in? 
            @gig = Gig.find(params[:id])
            @user = current_user
            erb :"gigs/show"
        else
            flash[:alert] = "You are not authorized to view this gig."
            redirect "/login"
        end
    end

    get '/gigs/:id/edit' do
        @gig = Gig.find(params[:id]) 
        if current_user == @gig.user
            erb :"gigs/edit"
        else
            flash[:message] = "You are not authorized to edit this gig."
            redirect "/login"
        end
    end

    patch '/gigs/:id' do
        if logged_in?
            @gig = Gig.find(params[:id])
    
            @gig.update(date: params[:date], description: params[:description], payment: params[:payment], expenses: params[:expenses]) if current_user == @gig.user
            flash[:success] = "Your gig has been updated!"
            redirect "/gigs/#{@gig.id}"
        else
            flash[:error] = "#{@gig.errors.full_messages.to_sentence}"
            redirect "/login"
        end
    end

    delete '/gigs/:id' do
        @gig = Gig.find(params[:id])
        @gig.delete
        flash[:message] = "Your gig has been deleted."
        redirect "/gigs"
    end

end