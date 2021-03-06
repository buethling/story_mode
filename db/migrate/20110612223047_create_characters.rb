class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.integer :story_id
      t.integer :user_id

      t.timestamps
    end
    add_index :characters, :story_id
    add_index :characters, :user_id
  end

  def self.down
    drop_table :characters
  end
end
