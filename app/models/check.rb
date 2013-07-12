class Check < ActiveRecord::Base
  attr_accessible :comment_id, :essay_id, :topic_id, :user_id, :viewed
	belongs_to	:comment
	belongs_to	:essay
	belongs_to	:topic
	belongs_to	:user
end
