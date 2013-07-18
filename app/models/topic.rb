class Topic < ActiveRecord::Base
  attr_accessible :content, :user_id, :username, :count
	has_many	:essays
	belongs_to	:user

	def content=(value)
		result = value.gsub(/\b(\w+)\b/) do |s|
			'<span class="word">' + s + '</span>'
		end
		write_attribute(:content, result)
	end
end
