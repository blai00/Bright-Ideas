class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :destroy]
  def index
    @ideas = Idea.all
  end
  
  def create
    idea = Idea.create(idea_params)
    puts idea_params
    puts '/'*80
    puts idea.errors.full_messages
    flash[:message] =idea.errors.full_messages unless idea.save
    redirect_to ideas_url
  end 

  def show
  end
  
  def destroy
    @idea.destroy
    redirect_to ideas_url
  end
  
  private
  def idea_params
    params.require(:idea).permit(:content, :user_id)
  end
  
  def set_idea
    @idea = Idea.find(params[:id])
  end
end
