class AddFromPatientsAndToPatientsToWorldStatistic < ActiveRecord::Migration
  def self.up
    add_column :world_statistics, :from_patients, :float
    add_column :world_statistics, :to_patients, :float
  end

  def self.down
    remove_column :world_statistics, :to_patients
    remove_column :world_statistics, :from_patients
  end
end
