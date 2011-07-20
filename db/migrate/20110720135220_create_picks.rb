class CreatePicks < ActiveRecord::Migration
  def self.up
    create_table :picks do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :period_id

      t.timestamps
    end
  end

  def self.down
    drop_table :picks
  end
end
