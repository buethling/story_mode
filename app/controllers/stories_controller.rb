class StoriesController < ApplicationController
  before_filter :set_stories, :except => [:index, :create, :new]
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def new
    @title = "New Story"
    if signed_in?
      @story = Story.new
    else
      redirect_to root_path
    end
  end

  def create
    @story = current_user.stories.build(params[:story])
    if @story.save
      flash[:success] = "Story created!"
      redirect_to stories_path
    else
      render 'pages/home'
    end
  end

  def show
    @title = "Stories | Show"
  end

  def index
    @stories = Story.paginate(:page => params[:page], :per_page => 5)
    @title = "Stories"
  end

  def destroy
    @story.destroy
    redirect_back_or root_path
  end

  private
    def authorized_user
      redirect_to root_path unless current_user?(@story.user)
    end

    def set_stories
      @story = Story.find(params[:id])
    end
end
