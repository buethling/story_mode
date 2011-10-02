require 'spec_helper'

describe Storyteller do
  before do 
    @story = Story.new
  end

  it "know how to start the game" do
    @story.stub(:followers).and_return([
      User.new.tap { |u| u.stub(:id).and_return(1) }
    ])
    @story.stub(:turn).and_return(nil)
    @story.should_receive(:update_attribute).with(:turn, 1).and_return(true)
    Storyteller.advance @story
  end

  it "should be able to correctly advance the game" do 
    @story.stub(:followers).and_return(
      2.times.map do |i|
        User.new.tap { |u| u.stub(:id).and_return(i + 1) }
      end
    )
    @story.stub(:turn).and_return(1)
    @story.should_receive(:update_attribute).with(:turn, 2).and_return(true)
    Storyteller.advance @story
  end

  it "should keep the turn on the current user when only one follower" do
    @story.stub(:followers).and_return([
      User.new.tap { |u| u.stub(:id).and_return(1) }
    ])
    @story.stub(:turn).and_return(1)
    @story.should_receive(:update_attribute).with(:turn, 1).and_return(true)
    Storyteller.advance @story
  end

  it "should update turn to nil when there are no longer any followers" do
    @story.stub(:turn).and_return(nil)
    @story.stub(:followers).and_return([])
    @story.should_receive(:update_attribute).never
    Storyteller.advance @story
  end

end
