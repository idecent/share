class CreateShareUrls < ActiveRecord::Migration
  def self.up
    create_table :share_urls do |t|
      t.integer :user_id
      t.integer :url_id
      t.string :s_type

      t.timestamps
    end
  end

  def self.down
    drop_table :share_urls
  end
end
