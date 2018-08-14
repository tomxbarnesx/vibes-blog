class Post < ActiveRecord::Base
    has_many :vibe_connections
    has_many :vibes, through: :vibe_connections
end