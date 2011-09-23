class Group < ActiveRecord::Base

  has_many :markers, :dependent => :destroy

  validates_presence_of :title
end

