require 'spec_helper'

describe Idea do
  it "is valid with valid attributes" do
    idea = Idea.new(:title => "Test idee titel", :description => "Test description")
  end
  
  it "is not valid without a title" do
    idea = Idea.new
    idea.title = nil
    idea.description = "A valid description"
    
    idea.valid?.should_not == true
  end
  
  it "is not valid without a description" do
    idea = Idea.new
    idea.title = "A valid title"
    idea.description = nil
    
    idea.valid?.should_not == true
  end
end
