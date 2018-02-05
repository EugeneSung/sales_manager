require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "unlockable"
  end

  get '/' do
    if logged_in?
      @user = User.find_by(id: current_user.id)
      #binding.pry
      erb :"/users/show_user"
    else
      erb :index
    end

  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
