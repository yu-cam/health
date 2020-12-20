class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@topics = Topic.all
    @new_topic = Topic.new
  end

  def show
  	@topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
  	@new_topic = Topic.new(topic_params)
  	@new_topic.save!
  	redirect_to topic_path(@new_topic.id)
  end

  def edit
  	@topic = Topic.find(params[:id])
  end

  def update
  	@topic = Topic.find(params[:id])
  	@topic.update(topic_params)
  	redirect_to topics_path
  end

  def destroy
  	topic = Topic.find(params[:id])
  	topic.destroy
  	redirect_to topics_path
  end

  private
  def topic_params
  	params.require(:topic).permit(:title, :body)
  end

end
