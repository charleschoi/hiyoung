class Comment < ActiveRecord::Base
  attr_accessible :content, :sentence_id, :user_id, :username
	belongs_to	:sentence
	belongs_to	:user
	has_many	:checks
end
