class Essay < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id, :username, :summary, :is_view
	belongs_to	:topic
	belongs_to	:user
	has_many	:sentences
	has_many	:check
	def content=(value)
		result = value.gsub(/\b(\w+)\b/) do |s|
		'<span class="word">' + s + '</span>'
		end
		write_attribute(:content, result)
	end
	
end
