require 'spec_helper'

describe IdeasController do
    
  describe "GET index" do
    
    it "loads all ideas into @ideas" do
      idea = mock_model(Idea)
      Idea.should_receive(:all_by_newest).and_return([idea])
      get :index
      assigns(:ideas).should == [idea]
    end
    
  end
  
  describe "GET show" do
    
    it "fetches the idea" do
      Idea.should_receive(:find).with(20)
      get :show, :id => 20
    end
    
    it "assigns @idea" do
      idea = mock_model(Idea)
      Idea.should_receive(:find).and_return(idea)
      get :show, :id => 20
      assigns(:idea).should eq(idea)
    end
    
  end
  
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
  
  describe "POST destroy" do
    
    let(:idea) { mock_model(Idea).as_null_object }
    
    it "finds the idea" do
      Idea.should_receive(:find).with(20).and_return(idea)
      post :destroy, :id => 20
    end
    
    it "destroys the idea" do
      Idea.should_receive(:find).and_return(idea)
      idea.should_receive(:destroy)
      post :destroy, :id => 20
    end
    
    it "redirects to the ideas index" do
      Idea.should_receive(:find).and_return(idea)
      post :destroy, :id => 20
      response.should redirect_to(:action => "index")
    end
    
  end
  
  describe "GET edit" do
    
    it "finds the idea" do
      Idea.should_receive(:find).with(20)
      get :edit, :id => 20
    end
    
    it "assigns @idea" do
      idea = mock_model(Idea)
      Idea.should_receive(:find).and_return(idea)
      get :edit, :id => 20
      assigns(:idea).should eq(idea)
    end
    
  end
  
  describe "PUT update" do
    
    let(:idea) { idea = mock_model(Idea).as_null_object }
    
    it "finds the idea" do
      Idea.should_receive(:find).with(20).and_return(idea)
      put :update, :id => 20
    end
    
    it "updates the attributes" do
      Idea.should_receive(:find).and_return(idea)
      idea.should_receive(:update_attributes).with({"title" => "Modified title"})
      put :update, :id => 20, :idea => { :title => "Modified title"}
    end
    
    it "redirects to the show action" do
      Idea.should_receive(:find).and_return(idea)
      put :update, :id => 20
      response.should redirect_to(:action => "show", :id => idea.id)
    end
    
  end
  
end
