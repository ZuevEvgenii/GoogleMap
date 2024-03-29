class Marker < ActiveRecord::Base
  include ActionView::Helpers::JavaScriptHelper
  validates_presence_of :name, :group, :address

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  acts_as_gmappable
  belongs_to :group
  belongs_to :icon

  belongs_to :user

  before_save :check_html

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_sidebar
    self.name + " (#{self.address})"
  end


  def gmaps4rails_marker_picture


    image = self.icon ? self.icon.marker_icon.url(:thumb) : "/images/marker.png"

    if self.name == "Your position"
      image = "/images/client_arrow.png"
    end

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

  def check_html
    self.description = escape_javascript(self.description)
  end

end

