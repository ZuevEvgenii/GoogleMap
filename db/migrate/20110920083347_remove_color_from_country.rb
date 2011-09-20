class RemoveColorFromCountry < ActiveRecord::Migration
  def self.up
    remove_column :countries, :color
  end

  def self.down
    add_column :countries, :color, :string
  end
end

