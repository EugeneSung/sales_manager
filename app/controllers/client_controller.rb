require './config/environment'

class ClientController < ApplicationController

  get "/users/add_client" do
    erb :'/users/edit_user'
  end

end
