class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :story_id
      t.string :user_id

      t.timestamps
    end
    add_index :characters, :story_id
    add_index :characters, :user_id
  end

  def self.down
    drop_table :characters
  end
end
