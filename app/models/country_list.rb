class CountryList < ActiveRecord::Base
  has_one :country, :dependent => :nullify

  def self.rest
    result = []
    CountryList.all.each do |c|
      result << c if c.country == nil
    end
    result
  end

  def self.restik(country)
    result = []
    CountryList.all.each do |c|
      result << c if c.country == nil
    end
    result << CountryList.find(country.country_list.id)
  end
end

