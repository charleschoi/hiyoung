class Check < ActiveRecord::Base
  attr_accessible :comment_id, :essay_id, :topic_id, :user_id, :viewed
end