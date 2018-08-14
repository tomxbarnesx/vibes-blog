class Post < ActiveRecord::Base
    has_many :vibes, through: :vibe_connections
end