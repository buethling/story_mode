class Story < ActiveRecord::Base
  attr_accessible :blurb

  belongs_to :user

  validates :user_id, :presence => true
  validates :blurb, :presence => true, :length => { :maximum => 2500 }
end
