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
        # Find user with the same username and password.
        @user = User.find_by(:username => params[:username])
        # needed solutions to add "@user != nil && ". Don't understand why else statement didn't work.  
        if  @user != nil && @user.password == params[:password]
            session[:user_id] = @user.id
            redirect '/account'
        end
        erb :error   
    end

    get '/account' do
        @current_user = User.find_by(:id => session[:user_id])
        if @current_user
            erb :account
        else
            erb :error
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/error' do
        erb :error
    end


end

