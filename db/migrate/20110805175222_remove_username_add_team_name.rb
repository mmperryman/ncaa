class RemoveUsernameAddTeamName < ActiveRecord::Migration
  def self.up
    add_column :users, :team_name, :string
    remove_column :users, :username
  end

  def self.down
    remove_column :users, :team_name
    add_column :users, :username, :string
  end
end
