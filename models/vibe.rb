class Vibe < ActiveRecord::Base
    belongs_to :user
    has_many :vibe_connections
    has_many :posts, through: :vibe_connections
    has_many :tags, through: :tag_connections
end