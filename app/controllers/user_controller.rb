require './config/environment'

class UserController < ApplicationController
  get '/signup' do
    if logged_in?
      erb :'/users/show_user'
    else
      erb :"/users/create_user"
    end
  end

  post '/signup' do
    #binding.pry

    if !params[:name].empty? && !params[:username].empty? && !params[:password].empty?
      @user = User.create(params)

      session[:user_id] =@user.id

      redirect to '/'
    else

      redirect to "/signup"
    end

  end
  get '/login' do
    if logged_in?
      redirect to '/show_user'
    else
      erb :'/users/login'
    end
  end
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb  :'users/show_user'
    else
      redirect '/login'
    end

  end
  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end



end
