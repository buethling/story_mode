class PhrasesController < ApplicationController
  def create
    @current_story = Story.find(params[:story_id])
    @followers = @current_story.followers
    @phrase = @current_story.phrases.build(params[:phrase])
    @phrase[:user_id] = current_user.id
    
    if @phrase.save
      redirect_to story_path(@current_story) 
    else
      render 'pages/home'
    end
    
    update_turn unless @followers.empty?
  end

  def index
    @story = Story.find(params[:story_id])
    @phrase_feed = @story.phrases
    render 'phrases/index', :layout => false 
  end
  
  private
    def update_turn
      unless @current_story.turn.nil? && @followers.length <= 1 
        @current_story.turn=@current_story.follower_ids[((@current_story.follower_ids.index(@current_story.turn)+1)%@current_story.followers.count)]
        @current_story.save
      end
    end
end
