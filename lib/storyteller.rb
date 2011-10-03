module Storyteller
  @logger = Logger.new(STDOUT)
  
  # Advance a story to the next character.
  #
  def self.advance(story)
    if followers = story.followers 
      unless followers.empty?
        follower_ids = followers.map(&:id)

        if story.turn.nil?
          story.set_turn! follower_ids.first
        else
          story.set_turn! follower_ids[(follower_ids.index(story.turn)+1)%followers.count]
        end
      end
    end
  end
  
  def self.retreat(story)
    if followers = story.followers
      if followers.empty?
        clear(story)
      elsif followers.length == 1
        follower_ids = followers.map(&:id)
        @logger.debug "followers.length: #{followers.length}"
        story.set_turn! follower_ids.first
      else
        advance(story)
      end
    end
  end
  
  def self.clear(story)
    story.set_turn! nil
  end

end
