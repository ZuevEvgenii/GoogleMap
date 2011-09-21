class Marker < ActiveRecord::Base
  @@current_location

  def self.set_loc(loc)
    @@current_location = loc
  end

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

  belongs_to :group

  belongs_to :icon

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_sidebar
    self.name + " (#{self.address})"
  end


  def gmaps4rails_marker_picture
    image = self.icon ? self.icon.marker_icon.url(:thumb) : "/images/marker.png"
    return { "marker_anchor" => [0, true],
      "rich_marker" => "<img src='#{image}'></img>"}
  end

  def gmaps4rails_infowindow
    image = self.icon ? "<img src='#{self.icon.marker_icon.url(:thumb)}'></img>" : ""
    "<h1>#{self.name}</h1>" + image + "<p>#{self.address}</p>" + "<p>#{self.description}</p>"
  end

  def iconka
    "#{self.icon.marker_icon.url(:thumb) ? self.icon.marker_icon.url(:thumb) : "/images/marker.png"}"
  end

end

