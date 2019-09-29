class User < ApplicationRecord
    has_many :posts
    attr_accessor :remember_token
    
    def self.new_token
        SecureRandom.urlsafe_base64
    end
    
    def User.digest(string)
        Digest::SHA1.hexdigest(string)
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        Bcrypt::Password.new(remember_digest).is_password?(remember_token)
    end 
    
    def forget
        update_attribute(:remember_digest, nil)
    end
        
    has_secure_password
end
