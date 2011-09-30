class Story < ActiveRecord::Base
  attr_accessible :title, :blurb, :character_count, :turn

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
    self.followers.include?(user)
  end

  def full?
    self.character_count <= self.followers.count
  end

  def update_turn
    if self.followers.empty?
      self.turn = nil
    elsif self.turn.nil?
      self.turn = follower_ids.first
    else
      self.turn = follower_ids[(follower_ids.index(turn)+1)%followers.count]
    end
    self
  end

  def update_turn!
    self.update_turn.save!
  end

  def set_turn
    if self.turn.nil?
      self.turn = self.follower_ids.first
    end
    self
  end

  def set_turn!
    self.set_turn.save!
  end

end
