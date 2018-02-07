require './config/environment'

class ClientController < ApplicationController

  get "/clients/add_client" do
    erb :'/clients/add_client'
  end
  post "/clients/add_client" do
    if logged_in?
      @client = Client.create(params)
      @client.user_id = current_user.id
      @client.save
      redirect '/'
    else
      redirect '/login'
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
  get '/:slug/add_order' do
    @client = Client.find_by_slug(params[:slug])
    erb :"orders/add_order"
  end
  post '/:slug/add_order' do

    @client = Client.find_by_slug(params[:slug])
    @order = Order.create(params[:order])
    @order.client_id = @client.id
    @order.save

  end

end
