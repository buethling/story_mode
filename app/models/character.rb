class Character < ActiveRecord::Base
  attr_accessible :story_id

  belongs_to :story
  belongs_to :user

  validates :story_id, :presence => true
  validates :user_id, :presence => true
end
