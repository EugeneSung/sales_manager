require './config/environment'

class ItemController < ApplicationController
  get '/items' do

    if logged_in?
        erb :"/items/index"
    else
      redirect '/login'
    end

  end

  get '/items/add_item' do
    if logged_in?
      erb :"/items/add_item"
    else
      redirect '/login'
    end

  end
  post '/items/add_item' do
    if logged_in?
      @item = Item.create(params)
      redirect "/items"
    else
      redirect '/login'
    end
  end
  get '/items/:id' do
    if logged_in?
      @item = Item.find_by(id: params[:id])
      erb :'/items/show_item'
    else
      redirect '/login'
    end
  end

  patch "/items/:id/edit" do
    if logged_in?

        @item = Item.find_by(params[:id])
        if @item && !params[:name].empty?
          @item.name = params[:name]
          @item.price = params[:price]
          @iten.description = params[:description]
          @item.save
          redirect "/items"
        else
          redirect "/items/#{@item.id}/edit"
        end
    else
      redirect '/login'
    end
  end
  delete "/items/:id/delete" do
    if logged_in?
      @item = Item.find_by(id: params[:id])
      @item.delete
      @item.save
      redirect "/items"
    else
      redirect '/login'
    end
  end


end
