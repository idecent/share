class EditUrls < ActiveRecord::Migration
  def self.up
    remove_column :urls, :user_id
    remove_column :urls, :s_type
    remove_column :urls, :content
  end

  def self.down
    add_column :urls, :user_id
    add_column :urls, :s_type
    add_column :urls, :content, :text
  end
end
