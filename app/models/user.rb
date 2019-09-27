class User < ApplicationRecord
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    has_secure_password
end
