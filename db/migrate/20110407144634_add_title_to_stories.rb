class AddTitleToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :title, :string
    add_index :stories, :title
  end
  def self.down
    remove_column :stories, :title
  end
end
