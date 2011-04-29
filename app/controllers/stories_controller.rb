class StoriesController < ApplicationController
  def new
    @title = "New Story"
    @story = Story.new if signed_in?
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
    @user = User.find(params[:id])
    @stories = @user.stories.paginate(:page => params[:page])
    @title = "Stories | Show"
  end

  def index
    @stories = Story.paginate(:page => params[:page], :per_page => 5)
    @title = "Stories"
  end

end
