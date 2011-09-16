class Group < ActiveRecord::Base

  has_many :markers, :dependent => :destroy

end

