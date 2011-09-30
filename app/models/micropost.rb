class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  def self.reverse_chronological
    order('microposts.created_at desc')
  end

  def self.chronological
    order('microposts.created_at asc')
  end
end
