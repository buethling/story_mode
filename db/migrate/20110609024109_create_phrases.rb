class CreatePhrases < ActiveRecord::Migration
  def self.up
    create_table :phrases do |t|
      t.string :content
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
    add_index :phrases, :story_id
  end

  def self.down
    drop_table :phrases
  end
end
