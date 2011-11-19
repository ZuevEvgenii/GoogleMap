class WorldStatistic < ActiveRecord::Base
  validates_presence_of :population, :from, :to, :from_patients, :to_patients
end

