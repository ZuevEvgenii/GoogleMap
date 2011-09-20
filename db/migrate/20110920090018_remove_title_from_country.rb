class RemoveTitleFromCountry < ActiveRecord::Migration
  def self.up
    remove_column :countries, :title
  end

  def self.down
    add_column :countries, :title, :string
  end
end

