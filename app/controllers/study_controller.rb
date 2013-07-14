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

		redirect_to :controller => "study", :action => "write", :id => topic.id
	end

  def essay
		@essay = Essay.all
  end

  def write
		@topic = Topic.find(params[:id])
  end

	def write_process
		if params[:content] == ""
			flash[:notice] = "Write please..."
			redirect_to :controller => "study", :action => "write", :id => params[:id]
		else
			require 'classification_and_summarization'
			test = ClassifierAndSummarization.new
			test.train([['public/wikipedia_text/computers.txt', "Computers"],
			             ['public/wikipedia_text/economy.txt', "Economy"],
			             ['public/wikipedia_text/health.txt', "Health"],
			             ['public/wikipedia_text/software.txt', "Software"]])
			require 'pp'
			a = pp test.classify_and_summarize_plain_text(params[:content])

			essay = Essay.new
			essay.user_id = current_user.id
			essay.username = current_user.name
			essay.topic_id = params[:id]
			essay.content = params[:content]
			essay.summary = a[1]
			puts test.inspect
			if essay.save
				require 'punkt-segmenter'
				tokenizer = Punkt::SentenceTokenizer.new(essay.content)
				result = tokenizer.sentences_from_text(essay.content, :output => :sentences_text)
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
				sentence.content = "Total :"
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
		comment.save

		redirect_to :controller => "study", :action => "comment", :id => params[:essay_id], :anchor => comment.id
	end

	def news
		@name = User.find(session[:user_id])

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
