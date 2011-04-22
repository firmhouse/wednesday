require 'spec_helper'

describe IdeasController do
  
  render_views
  
  describe "GET new" do
    
    it "initializes a new idea" do
      new_idea = Idea.new
      Idea.should_receive(:new).and_return(new_idea)
      get :new
      assigns(:idea).should == new_idea
    end
    
  end
  
  describe "POST create" do
    
    let(:idea) { mock_model(Idea).as_null_object }
    
    before do
      Idea.stub(:new).and_return(idea)
    end
    
    it "creates a new idea" do
      Idea.should_receive(:new)
        .with("title" => "The title of the idea", "description" => "The description of the idea")
        .and_return(idea)
      post :create, :idea => {:title => "The title of the idea", :description => "The description of the idea"}
    end
    
    context "when the idea is saved successfully" do
      
      before do
        idea.should_receive(:save).and_return(true)
      end
    
      it "redirects to the ideas index" do
        post :create
        response.should redirect_to(:action => "index")
      end
      
    end
    
    context "when the idea fails to save" do
      before do
        idea.should_receive(:save).and_return(false)
      end
      
      it "assigns @idea" do
        post :create
        assigns(:idea).should == idea
      end
      
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
      
    end
    
  end
  
end
