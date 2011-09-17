class Marker < ActiveRecord::Base

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

  belongs_to :group

  belongs_to :icon

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_sidebar
    self.name
  end


  def gmaps4rails_marker_picture
    {
      "marker_anchor" => [0, true],
      "rich_marker" => "<img src='#{self.icon.marker_icon.url(:thumb) ? self.icon.marker_icon.url(:thumb) : "/images/marker.png"}'></img>"}
  end

  def gmaps4rails_infowindow
    image = self.icon.marker_icon.url(:thumb) ? "<img src='#{self.icon.marker_icon.url(:thumb)}'></img>" : ""
    "<h1>#{self.name}</h1>" + image + "<p>#{self.address}</p>" + "<p>#{self.description}</p>"
  end

  def iconka
    "#{self.icon.marker_icon.url(:thumb) ? self.icon.marker_icon.url(:thumb) : "/images/marker.png"}"
  end

end

