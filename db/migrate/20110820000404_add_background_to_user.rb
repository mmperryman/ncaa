class AddBackgroundToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :background, :string, :default => "bluesky.jpg"
  end

  def self.down
    remove_column :users, :background
  end
end
