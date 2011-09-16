class CreateMarkers < ActiveRecord::Migration
  def self.up
    create_table :markers do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :markers
  end
end

