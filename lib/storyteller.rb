module Storyteller

  # Advance a story to the next character.
  #
  def self.advance(story)
    if followers = story.followers 
      unless followers.empty?
        follower_ids = followers.map(&:id)

        if story.turn.nil?
          story.update_attribute(:turn, follower_ids.first)
        else
          story.update_attribute(:turn, 
            follower_ids[(follower_ids.index(story.turn)+1)%followers.count]
          )
        end
      end
    end
  end

end
