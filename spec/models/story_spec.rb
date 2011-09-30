require 'spec_helper'

describe Story do
  before do 
    @story = Story.new
  end

  it { should belong_to(:user) }
  it { should have_many(:phrases) }
  it { should have_many(:characters) }
  it { should have_many(:followers) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:blurb) }
  it { should validate_presence_of(:character_count) }
  it { should_not allow_value(8).for(:character_count) }
  it { should allow_value(6).for(:character_count) }
  it { should_not allow_value('x' * 251).for(:title) }
  it { should allow_value('x' * 249).for(:title) }
  it { should_not allow_value('x' * 2501).for(:blurb) }
  it { should allow_value('x' * 2499).for(:blurb) }

  it "should know if a user is a follower of this story" do 
    user = mock_model(User)
    @story.stub(:followers).and_return([user])
    @story.follower?(user).should be_true
  end

  it "should be considered full when it hits the character count" do 
    @story.character_count = 6
    @story.stub_chain(:followers, :count).and_return(7)
    @story.full?.should be_true
  end

  it "should be able set turn to first follower when previously nil" do
    @story.turn = nil
    @story.stub(:follower_ids).and_return([1])
    @story.set_turn.turn.should eq 1
  end

  it "should be able to update turn to next follower (if there is more than one)" do
    user = mock_model(User)
    @story.stub(:follower_ids).and_return([1,2])
    @story.stub(:followers).and_return([user,user])
    @story.turn = 1
    @story.update_turn.turn.should eq 2
  end

  it "should keep the turn on the current user when only one follower" do
    user = mock_model(User)
    @story.stub(:follower_ids).and_return([1])
    @story.stub(:followers).and_return([user])
    @story.turn = 1
    @story.update_turn.turn.should eq 1
  end

  it "should update turn to nil when there are no longer any followers" do
    @story.stub(:followers).and_return([])
    @story.update_turn.turn.should eq nil
  end

end
