class Comment < ActiveRecord::Base
  attr_accessible :content, :setence_id, :user_id
end
