class IdeasController < ApplicationController
  def index
    
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
    
  end
end
