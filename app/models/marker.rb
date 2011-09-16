class Marker < ActiveRecord::Base

  mount_uploader :marker_icon, MarkerIconUploader

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable

  belongs_to :group

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_sidebar
    self.name
  end


  def gmaps4rails_marker_picture
    {
      "marker_anchor" => [0, true],
      "rich_marker" => "<img src='#{self.marker_icon.url(:thumb) ? self.marker_icon.url(:thumb) : "/images/marker.png"}'></img>"}
  end

  def gmaps4rails_infowindow
    image = self.marker_icon.url(:thumb) ? "<img src='#{self.marker_icon.url(:thumb)}'></img>" : ""
    "<h1>#{self.name}</h1>" + image + "<p>#{self.address}</p>" + "<p>#{self.description}</p>"
  end

end

