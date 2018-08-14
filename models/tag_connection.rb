class TagConnection < ActiveRecord::Base
    belongs_to :tag
    belongs_to :vibe
end