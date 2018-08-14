class VibeConnection < ActiveRecord::Base
    belongs_to :vibe
    belongs_to :post
end