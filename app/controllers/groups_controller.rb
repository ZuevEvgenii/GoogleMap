class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    search_range = params[:search_range].blank? ? 50 : params[:search_range]


    if params[:search].present?
      @markers = @group.markers.near(params[:search], search_range, :order => :distance)
      if @markers.empty?
        @markers = @group.markers
        @adjust = false
        flash[:notice] = "There is no objects near you."
      end
    else
      if !request.location.city.blank?
        @markers = @group.markers.near(request.location.country + " , " + request.location.city, search_range, :order => :distance)
        params[:search] = request.location.country + " , " + request.location.city
      else
        @markers = @group.markers
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.xml
    end
  end
end

