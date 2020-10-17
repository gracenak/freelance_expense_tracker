class GigsController < ApplicationController

    get '/gigs' do
        if logged_in?
            @gigs = Gig.all
            @user = current_user
            erb :"gigs/index"  
        else
            redirect "/login"    
        end
    end

    get '/gigs/new' do
        if logged_in?
            @user = current_user
            erb :"gigs/new"
        else
            redirect "/login"
        end
    end

    post '/gigs' do
        @user = current_user
        @gig = Gig.create(params)
        if !params[:employer].empty? && !params[:date].empty? && !params[:description].empty? && !params[:payment].empty? && !params[:expenses].empty?
            @user.gigs << @gig
            redirect "/gigs/#{@gig.id}"
        else
            redirect "/gigs/new"
        end
    end

    get '/gigs/:id' do
        if logged_in?
            @gig = Gig.find(params[:id])
            @user = current_user
            erb :"gigs/show"
    
        else
            redirect "/login"
        end
    end

    get '/gigs/:id/edit' do
        if logged_in?
            @gig = Gig.find(params[:id])
            erb :"gigs/edit"
        else
            redirect "/login"
        end
    end

    patch '/gigs/:id' do
        if logged_in?
            @gig = Gig.find(params[:id])
    
            @gig.update(date: params[:date], description: params[:description], payment: params[:payment], expenses: params[:expenses]) if current_user == @gig.user
           
            redirect "/gigs/#{@gig.id}"
        else
            redirect "/login"
        end
    end

    delete '/gigs/:id' do
        @gig = Gig.find(params[:id])
        @gig.delete
        redirect "/gigs"
    end

end