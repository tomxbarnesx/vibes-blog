class User < ActiveRecord::Base
    has_many :vibes, :dependent => :destroy
end