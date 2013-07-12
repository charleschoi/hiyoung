class Topic < ActiveRecord::Base
  attr_accessible :content, :user_id, :username, :count
	has_many	:essays
	belongs_to	:user
end
