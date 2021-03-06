class StudyController < ApplicationController
  def index
		@hot_topic = Topic.order("count DESC").first(10)
		@recent_essay = Essay.last(10).reverse
		session[:query] = "Click a word!"
  end

  def topic
		@topic = Topic.all
  end

	def topic_process
		if params[:content] == ""
			flash[:notice] = "Write topic please..."
			redirect_to :controller => "study", :action => "index"
		else
			topic = Topic.new
			topic.username = current_user.name
			topic.user_id = current_user.id
			topic.content = params[:content]
			topic.count = 0
			topic.save

			redirect_to :controller => "study", :action => "write", :id => topic.id
		end
	end

  def essay
		if params[:id] =~ /u/
			@essay = Essay.where(:user_id => params[:id].sub("u",""))
		elsif params[:id] =~ /\d/
			@essay = Essay.where(:topic_id => params[:id])
		else
			@essay = Essay.all
		end
  end

  def write
		@topic = Topic.find(params[:id])
  end

	def write_process
		if params[:content] == "" or params[:title] == ""
			flash[:notice] = "Write please..."
			redirect_to :controller => "study", :action => "write", :id => params[:id]
		else
			essay = Essay.new
			essay.user_id = current_user.id
			essay.username = current_user.name
			essay.topic_id = params[:id]
			essay.content = params[:content]
			essay.summary = params[:title]
			#puts test.inspect
			if essay.save
				topic = essay.topic
				topic.count += 1
				topic.save
				require 'punkt-segmenter'
				tokenizer = Punkt::SentenceTokenizer.new(params[:content])
				result = tokenizer.sentences_from_text(params[:content], :output => :sentences_text)
				result.each do |r|
					sentence = Sentence.new
					sentence.user_id = current_user.id
					sentence.essay_id = essay.id
					sentence.content = r
					sentence.save
				end
				sentence = Sentence.new
				sentence.user_id = current_user.id
				sentence.essay_id = essay.id
				sentence.content = "Grade this essay and make a general comment !"
				sentence.save
			end
			redirect_to :controller => "study", :action => "read", :id => essay.id
		end
	end

  def read
		Time.zone = 'Seoul'
		@essay = Essay.find(params[:id])
		@topic = @essay.topic
		@essays = Essay.where(:topic_id => @topic.id)
		
  end

  def comment
		Time.zone = 'Seoul'
		@sentences = Sentence.where(:essay_id => params[:id])
  end

	def comment_process
		comment = Comment.new
		comment.user_id = current_user.id
		comment.username = current_user.name
		comment.content = params[:content]
		comment.sentence_id = params[:id]
		if comment.save
			check = Check.new
			check.essay_id = comment.sentence.essay.id
			check.user_id = comment.sentence.essay.user_id
			check.by_id = current_user.id
			check.by_name = current_user.name
			check.content = params[:content]
			check.is_view = true
			check.save
		end

		redirect_to :controller => "study", :action => "comment", :id => params[:essay_id], :anchor => comment.id
	end

	def news
		@name = User.find(session[:user_id])
		@comments = Check.where(:user_id => session[:user_id]).where(:is_view => true)
	end

	def dismiss
		comment = Check.find(params[:id])
		if comment.user_id == session[:user_id]
			comment.is_view = false
			comment.save
			redirect_to :controller => "study", :action => "news" 
		else
			flash[:notice] = "something wrong..."
			redirect_to :root
		end
	end

	def change_username
		if params[:id] != session[:user_id]
			user = User.find(params[:id])
			user.name = params[:name]
			user.save
			redirect_to :controller => "study", :action => "news"
		else
			render :text => "Your are WRONG!!!"
		end
	end
end
