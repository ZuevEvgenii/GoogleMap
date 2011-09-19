class CreateCountryLists < ActiveRecord::Migration
  def self.up
    create_table :country_lists do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :country_lists
  end
end
