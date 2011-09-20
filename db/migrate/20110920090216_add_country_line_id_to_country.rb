class AddCountryLineIdToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :country_list_id, :integer
  end

  def self.down
    remove_column :countries, :country_list_id
  end
end
