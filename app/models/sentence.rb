class Sentence < ActiveRecord::Base
  attr_accessible :content, :essay_id, :user_id
	belongs_to	:essay
	belongs_to	:user
	has_many	:comments

end
