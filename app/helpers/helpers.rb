require 'sinatra/base'
class Helpers

    def self.current_user(sesh_hash) 
       @user = User.find_by_id(sesh_hash[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
    end

end