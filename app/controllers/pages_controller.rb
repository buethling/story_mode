class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @stories = current_user.stories.paginate(:page => params[:page], :per_page => 5)
      @joined_stories = @stories  #Character.find_by_user_id(current_user)
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
