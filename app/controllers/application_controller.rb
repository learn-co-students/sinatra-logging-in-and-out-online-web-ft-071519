require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
     @user = User.find_by_username(params[:username])
     if @user 
       session[:user_id] = @user.id
       @user = Helpers.current_user(session)
        redirect '/account'
     end
    redirect '/error'
  end

  get '/account' do

  end

  get '/logout' do

  end


end

