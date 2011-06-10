class Story < ActiveRecord::Base
  attr_accessible :title, :blurb

  belongs_to :user
  has_many :phrases

  validates :user_id, :presence => true
  validates :title, :presence => true, :length => { :maximum => 250 }
  validates :blurb, :presence => true, :length => { :maximum => 2500 }

  default_scope :order => 'stories.created_at DESC'
end
