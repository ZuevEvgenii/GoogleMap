class WorldStatistic < ActiveRecord::Base
  validates_presence_of :population, :percentage, :count
end

