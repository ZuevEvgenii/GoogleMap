class CreateIcons < ActiveRecord::Migration
  def self.up
    create_table :icons do |t|
      t.string :title
      t.string :marker_icon

      t.timestamps
    end
  end

  def self.down
    drop_table :icons
  end
end
