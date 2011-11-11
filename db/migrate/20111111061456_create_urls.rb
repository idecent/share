class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.string :origin
      t.string :release
      t.string :short
      
      t.string :content
      t.string :title
      
      t.integer :user_id
      t.integer :source_id
      t.timestamps
    end
  end

  def self.down
    drop_table :urls
  end
end
