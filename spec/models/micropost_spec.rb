require 'spec_helper'

describe Micropost do
  it { should belong_to(:user) } 
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should_not allow_value("x" * 200).for(:content) }
  it { should allow_value("x" * 139).for(:content) }
end
