class StudyController < ApplicationController
  def index
		@hot_topic = Topic.order("count DESC").first(6)
		@recent_essay = Essay.last(6)
  end

  def topic
		@topic = Topic.all
  end

	def topic_process
		topic = Topic.new
		topic.username = current_user.name
		topic.user_id = current_user.id
		topic.content = params[:content]
		topic.save

		redirect_to :root
	end

  def essay
		@essay = Essay.all
  end

  def write
  end

	def write_process
	end

  def read
  end

  def comment
  end

	def comment_process
	end
end
