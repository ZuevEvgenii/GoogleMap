class RenameOpacityToValueInCountry < ActiveRecord::Migration
  def self.up
    rename_column :countries, :opacity, :value
  end

  def self.down
    rename_column :countries, :value, :opacity
  end
end

