class Tag < ActiveRecord::Base
    has_many :vibes, through: :tag_connections
end