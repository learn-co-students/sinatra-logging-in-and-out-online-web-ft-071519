class Helpers
    def self.current_user(session_hash)
        @user = User.find(session_hash[:user_id])
    end

    def self.is_logged_in?(session_hash)
                # binding.pry
        self.current_user(session_hash).username == @user.username
    end
end