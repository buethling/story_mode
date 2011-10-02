class PhrasesController < ApplicationController
  def create
    @current_story = Story.find(params[:story_id])
    @phrase = @current_story.phrases.build(params[:phrase])
    @phrase[:user_id] = current_user.id
    
    if @phrase.save
      redirect_to story_path(@current_story) 
    else
      render 'pages/home'
    end
   
    Storyteller.advance(@current_story)
  end

  def index
    @story = Story.find(params[:story_id])
    @phrase_feed = @story.phrases
    render 'phrases/index', :layout => false 
  end
  
end
