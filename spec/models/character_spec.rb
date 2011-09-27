require 'spec_helper'

describe Character do
  it { should belong_to(:user) } 
  it { should belong_to(:story) } 
  it { should validate_presence_of(:story_id) } 
  it { should validate_presence_of(:user_id) } 
end
