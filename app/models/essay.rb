class Essay < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id, :username
end
