class User < ActiveRecord::Base
    has_secure_password
    has_many :gigs
end