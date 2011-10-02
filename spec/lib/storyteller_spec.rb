require 'spec_helper'

describe Storyteller do
  before do 
    @story = Story.new
  end

  it "should know how to start the story" do
    @story.stub(:followers).and_return([
      User.new.tap { |u| u.stub(:id).and_return(1) }
    ])
    @story.stub(:turn).and_return(nil)
    @story.should_receive(:set_turn).with(1).and_return(true)
    Storyteller.advance @story
  end

  it "should be able to correctly advance the story" do 
    @story.stub(:followers).and_return(
      2.times.map do |i|
        User.new.tap { |u| u.stub(:id).and_return(i + 1) }
      end
    )
    @story.stub(:turn).and_return(1)
    @story.should_receive(:set_turn).with(2).and_return(true)
    Storyteller.advance @story
  end

  it "should be able to correctly advance the story with one player" do 
    @story.stub(:followers).and_return([
      User.new.tap { |u| u.stub(:id).and_return(1) }
    ])
    @story.stub(:turn).and_return(1)
    @story.should_receive(:set_turn).with(1).and_return(true)
    Storyteller.advance @story
  end

  it "should know how to pause the story" do 
    @story.stub(:turn).and_return(nil)
    @story.stub(:followers).and_return([])
    @story.should_receive(:set_turn).never
    Storyteller.advance @story
  end

end
