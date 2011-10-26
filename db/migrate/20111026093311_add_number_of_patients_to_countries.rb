class AddNumberOfPatientsToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :number_of_patients, :integer
  end

  def self.down
    remove_column :countries, :number_of_patients
  end
end

