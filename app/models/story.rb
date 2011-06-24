class Story < ActiveRecord::Base
  attr_accessible :title, :blurb, :character_count

  belongs_to :user
  has_many :phrases
  has_many :characters, :dependent => :destroy
  has_many :followers, :through => :characters, :source => :user

  validates :user_id, :presence => true
  validates :title, :presence => true, :length => { :maximum => 250 }
  validates :blurb, :presence => true, :length => { :maximum => 2500 }
  validates :character_count, :presence => true, :inclusion => { :in => 1..7 }

  default_scope :order => 'stories.created_at DESC'

  def follower?(user)
    self.characters.find_by_user_id(user)
  end
end
