class RedoTeamLogo < ActiveRecord::Migration
  def self.up
    add_column :teams, :logo_url, :string
    add_column :teams, :espn_url, :string
    remove_column  :teams, :logo_file_name
    remove_column :teams, :logo_content_type
    remove_column :teams, :logo_file_size
    remove_column :teams, :logo_updated_at
  end

  def self.down

    remove_column :teams, :logo_url
    remove_column :teams, :espn_url

  end
end
