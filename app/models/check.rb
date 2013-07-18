class Check < ActiveRecord::Base
  attr_accessible :comment_id, :essay_id, :topic_id, :user_id, :viewed
	belongs_to	:comment
	belongs_to	:essay
	belongs_to	:topic
	belongs_to	:user

	def self.log(tag, id, user)
		a = self.new
		case tag
		when "comment" then a.comment_id = id
		when "essay" then a.essay_id = id
		when "topic" then a.topic_id = id
		end
		a.user_id = user
		a.save
	end
end
