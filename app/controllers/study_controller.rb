class StudyController < ApplicationController
  def index
		@hot_topic = Topic.all
		@recent_essay = Essay.all
  end

  def topic
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
