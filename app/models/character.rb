class Character < ActiveRecord::Base
  before_filter :authenticate

  belongs_to: story

  def create
    
  end
end
