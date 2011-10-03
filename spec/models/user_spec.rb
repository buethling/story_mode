require 'spec_helper'

describe User do
  before do
    @user = Factory(:user)
    @story = Factory(:story)
  end
  
  it "should set turn if it's not set" do
    @user.follow! @story
    @story.turn.should == 1    
  end
end
