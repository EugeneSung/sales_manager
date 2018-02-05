require './config/environment'

class UserController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect to '/clients'
    else
      erb :"/users/create_user"
    end
  end

  post '/signup' do
    #binding.pry

    if !params[:name].empty? && !params[:username].empty? && !params[:password].empty?
      @user = User.create(params)

      session[:user_id] =@user.id

      redirect to '/clients'
    else

      redirect to "/signup"
    end

  end


end
