require 'spec_helper'

describe Story do
  it { should belong_to(:user) }
  it { should have_many(:phrases) }
  it { should have_many(:characters) }
  it { should have_many(:followers) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:blurb) }
  it { should validate_presence_of(:character_count) }
end
