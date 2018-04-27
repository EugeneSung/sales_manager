require './config/environment'

class OrderController < ApplicationController
  get '/:slug/add_order' do
    if logged_in?
      @client = Client.find_by_slug(params[:slug])
      erb :"orders/add_order"
    else
      redirect '/login'
    end
  end
  post '/:slug/add_order' do
    if logged_in?
      @client = Client.find_by_slug(params[:slug])
      if Order.find_by(order_number: params[:order][:order_number])
        redirect "/#{@client.slug}/add_order"
      else
        @order = Order.create(params[:order])
        @order.client_id = @client.id
        @order.save
        redirect "/clients/#{@client.slug}"
      end
    else
      redirect '/login'
    end
  end
  get '/orders/:id' do
    if logged_in?

      @order = Order.find_by(order_number: params[:id])
      erb :"/orders/show_order"
    else
      redirect '/login'
    end

  end
  get "/orders/:id/edit" do
    if logged_in?
      @order = Order.find_by(order_number: params[:id] )
      erb :"/orders/edit_order"
    else
      redirect '/login'
    end
  end
  patch "/orders/:id/edit" do
    if logged_in? && !params[:order][:order_number].empty?
      @order = Order.find_by(order_number: params[:id])
      @order.update(params[:order])
      @order.save
      redirect "/orders/#{@order.order_number}"
    else
      redirect "/orders/#{@order.order_number}/edit"
    end
  end
  delete "/orders/:id/delete" do
    if logged_in?
      @order = Order.find_by(order_number: params[:id])
      if @order.user_id == current_user.id
        @order.delete
        @order.save
      end
    end
      redirect "/clients/#{@order.client.slug}"

  end

end
