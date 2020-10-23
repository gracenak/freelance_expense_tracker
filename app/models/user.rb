class User < ActiveRecord::Base
    has_secure_password
    has_many :gigs
    validates :email, presence: true
    validates :username, uniqueness: true    
end