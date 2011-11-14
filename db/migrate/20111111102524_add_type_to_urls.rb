class AddTypeToUrls < ActiveRecord::Migration
  def self.up
    add_column :urls, :s_type, :string
  end

  def self.down
    remove_column :urls, :s_type
  end
end
