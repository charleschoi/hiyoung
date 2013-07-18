class Sentence < ActiveRecord::Base
  attr_accessible :content, :essay_id, :user_id
	belongs_to	:essay
	belongs_to	:user
	has_many	:comments


	def content=(value)
		result = value.gsub(/\b(\w+)\b/) do |s|
		'<span class="word">' + s + '</span>'
		end
		write_attribute(:content, result)
	end
end
