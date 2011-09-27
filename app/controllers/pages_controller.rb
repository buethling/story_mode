class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @stories = current_user.stories.paginate(:page => params[:page], :per_page => 5)
      @joined_stories = current_user.follows.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def stories
    @title = "Public Stories"
    if signed_in?
      @title = "Your Stories"
    end
  end

  def contact
    @title = "Contact"
  end

  def about 
    @title = "About"
  end

  def help
    @title = "Help"
  end
end
