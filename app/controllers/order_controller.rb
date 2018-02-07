require './config/environment'

class OrderController < ApplicationController
  get '/:slug/add_order' do
    @client = Client.find_by_slug(params[:slug])
    erb :"orders/add_order"
  end
  post '/:slug/add_order' do

    @client = Client.find_by_slug(params[:slug])
    @order = Order.create(params[:order])
    @order.client_id = @client.id
    @order.save
    redirect "/clients/#{@client.slug}"

  end
  get '/orders/:id' do
    erb :"/orders/show_order"
  end


end
