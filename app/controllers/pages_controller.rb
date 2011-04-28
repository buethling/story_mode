class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 15)
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
