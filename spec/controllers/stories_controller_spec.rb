require 'spec_helper'

describe StoriesController do
  before do 
    @story = Story.create!(:title => "Test", :blurb => "Test", :character_count => 5)
    @user  = User.create!(:name => "Test Name", :email => "test@test.com", :password => "test", :confirmation => "test")
  end
  
  it "should set turn to be the name of user whos turn it currently is" do
    @user.follow!(@story)
    assigns(:turn).should == "Test Name"
  end
end
