require './config/environment'

class ClientController < ApplicationController

  get "/clients/add_client" do
    erb :'/clients/add_client'
  end
  post "/clients/add_client" do

    temp_client = Client.new(params)
     client = Client.find_by_slug(temp_client.slug)
    #binding.pry
    if client
      redirect '/clients/add_client'
    else
      if logged_in?
        @client = Client.create(params)
        @client.user_id = current_user.id
        @client.save
       redirect '/'
      else
        redirect '/login'
      end
    end
  end
  get '/clients/:slug' do
    @client = Client.find_by_slug(params[:slug])
    if logged_in?
      #binding.pry
      erb :"clients/show_client"
    else
      redirect '/login'
    end
  end
  get '/clients/:slug/edit' do

    @client = Client.find_by_slug(params[:slug])
    if @client.user_id == current_user.id
          #binding.pry
        erb :"/clients/edit_client"
    else
      redirect "/"
    end
  end

  patch "/clients/:slug/edit" do
    if logged_in?

        @client = Client.find_by_slug(params[:slug])
        if @client && !params[:name].empty?
          @client.name = params[:name]
          @client.address = params[:address]
          @client.phone = params[:phone]
          @client.save
          redirect "/clients/#{@client.slug}"
        else
          redirect "/clients/#{@client.slug}/edit"
        end
    else
      redirect '/login'
    end
  end
  delete "/clients/:slug/delete" do
    if logged_in?
      @client = Client.find_by_slug(params[:slug])
      @client.delete
      @client.save
      redirect "/"
    else
      redirect '/login'
    end
  end
end
