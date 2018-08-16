class Vibe < ActiveRecord::Base
    belongs_to :user
    has_many :vibe_connections, dependent: :destroy
    has_many :posts, through: :vibe_connections, dependent: :destroy
    has_many :tag_connections, dependent: :destroy
    has_many :tags, through: :tag_connections
end