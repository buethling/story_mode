class AddIndexToCharacters < ActiveRecord::Migration
  def self.up
    add_index :characters, [:user_id, :story_id], :unique => true
  end

  def self.down
  end
end
