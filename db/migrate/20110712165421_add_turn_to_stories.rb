class AddTurnToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :turn, :integer 
  end

  def self.down
    remove_column :stories, :turn
  end
end
