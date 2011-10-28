class StoriesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :update, :show]
  before_filter :set_stories, :except => [:index, :create, :new]
  before_filter :authorized_user, :only => [:destroy]

  def new
    @title = "New Story"
    if signed_in?
      @story = Story.new
      count_options 
    else
      redirect_to root_path
    end
  end

  def create
    @story = current_user.stories.build(params[:story])
    count_options 

    if @story.save
      flash[:success] = "Story created!"
      redirect_to story_path(@story)
    else
      render 'new' 
    end
  end

  def update
    if @story.update_attributes(params[:story])
      flash[:success] = "Story updated!"
    end
    redirect_to story_path(@story)
  end

  def show
    @title = "Stories | Show"
    @phrase_feed = @story.phrases
    @phrase = Phrase.new
    @followers = @story.followers
  end

  def index
    @stories = Story.paginate(:page => params[:page], :per_page => 5)
    @title = "Stories"
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private
    def authorized_user
      redirect_to root_path unless current_user?(@story.user)
    end

    def set_stories
      @story = Story.find(params[:id])
    end

    def count_options
      @count_opts = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]]
    end
end
