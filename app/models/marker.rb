class Marker < ActiveRecord::Base
  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

  belongs_to :group

end

