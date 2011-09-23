class Country < ActiveRecord::Base
  belongs_to :country_list

  validates_presence_of :country_list, :value
end

