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
		@topic = Topic.find(params[:id])
  end

	def write_process
		essay = Essay.new
		essay.user_id = 1 #current_user.id
		essay.username = "charles" #current_user.name
		essay.topic_id = params[:id]
		essay.content = params[:content]
		essay.summary = params[:content]
		essay.save

		redirect_to :controller => "study", :action => "read", :id => essay.id
	end

  def read
  end

  def comment
  end

	def comment_process
	end
end
