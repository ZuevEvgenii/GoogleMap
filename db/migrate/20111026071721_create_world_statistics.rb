class CreateWorldStatistics < ActiveRecord::Migration
  def self.up
    create_table :world_statistics do |t|
      t.string :population
      t.float :percentage
      t.float :count

      t.timestamps
    end
  end

  def self.down
    drop_table :world_statistics
  end
end
