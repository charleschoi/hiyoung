class Comment < ActiveRecord::Base
  attr_accessible :content, :sentence_id, :user_id, :username
	belongs_to	:sentence
	belongs_to	:user
	has_many	:checks
	def content=(value)
		result = value.gsub(/\b(\w+)\b/) do |s|
		'<span class="word">' + s + '</span>'
		end
		write_attribute(:content, result)
	end
end
