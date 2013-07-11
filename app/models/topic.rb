class Topic < ActiveRecord::Base
  attr_accessible :content, :user_id, :username, :count
end
