class AddCharacterCountToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :character_count, :integer, :default => 5
  end

  def self.down
    remove_column :stories, :character_count
  end
end
