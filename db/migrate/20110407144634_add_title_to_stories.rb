class AddTitleToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :title, :string
  end
  add_index :stories, :title

  def self.down
    remove_column :stories, :title
  end
end
