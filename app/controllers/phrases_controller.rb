class PhrasesController < ApplicationController
  def create
    @current_story = session[:current_story]
    @phrase = @current_story.phrases.build(params[:phrase])
    if @phrase.save
      #flash[:success] = "Phrase created!"
      redirect_to story_path 
    else
      #render 'pages/home'
    end
  end

  def destroy

  end
end
