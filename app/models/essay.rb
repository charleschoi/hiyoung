class Essay < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id, :username
	belongs_to	:topic
	belongs_to	:user
	has_many	:sentences
	has_many	:check
	
end
