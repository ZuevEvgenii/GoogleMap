class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def country_click
    @country = Country.find_by_title(CountryList.find_by_code(params[:region_code]).name)
    respond_to do |format|
		  format.js
		end
  end
end

