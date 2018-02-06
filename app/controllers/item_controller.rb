require './config/environment'

class ItemController < ApplicationController
  get '/items' do
    erb :"/items/index"
  end


end
