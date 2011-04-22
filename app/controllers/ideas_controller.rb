class IdeasController < ApplicationController
  def index
    @ideas = Idea.all_by_newest
  end
  
  def new
    @idea = Idea.new
  end
  
  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      redirect_to ideas_path
    else
      render "new"
    end
  end
  
  def show
    @idea = Idea.find(params[:id])
  end
  
  def destroy
    idea = Idea.find(params[:id])
    
    idea.destroy
    
    redirect_to ideas_path
  end
  
  def edit
    @idea = Idea.find(params[:id])
  end
  
  def update
    idea = Idea.find(params[:id])
    
    idea.update_attributes(params[:idea])
    
    redirect_to idea_path(idea)
  end
end
