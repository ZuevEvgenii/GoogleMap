class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def country_click
    @country = CountryList.find_by_code(params[:region_code]).country
    respond_to do |format|
		  format.js
		end
  end
end

