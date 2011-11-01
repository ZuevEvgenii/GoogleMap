class AddUserIdToMarker < ActiveRecord::Migration
  def self.up
    add_column :markers, :user_id, :integer
  end

  def self.down
    remove_column :markers, :user_id
  end
end

