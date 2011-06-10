class Phrase < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :story

  validates :content, :presence => true, :length => { :maximum => 1500 }
  validates :user_id, :presence => true
  validates :story_id, :presence => true

  default_scope :order => 'phrases.created_at ASC'
end
