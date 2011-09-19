class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    search_range = params[:search_range].blank? ? 50 : params[:search_range]
    @location = nil
    @markers = @group.markers
    if params[:search].present?
      @markers = @group.markers.near(params[:search], search_range, :order => :distance)
      @location = params[:search]
      if @markers.empty?
        @markers = @group.markers
        @adjust = false
        flash.now[:notice] = "There is no objects near you."
      end
    else
      if !request.location.city.blank?
        #@markers = @group.markers.near(request.location.country + " , " + request.location.city + " , " + request.location.address, search_range, :order => :distance)
        #params[:search] = request.location.country + " , " + request.location.city + " , " + request.location.address
        #@location = request.location.country + " , " + request.location.city + " , " + request.location.address
        @markers = @group.markers.near(request.location.latitude.to_s + request.location.longitude.to_s, search_range, :order => :distance)
        params[:search] = request.location.latitude.to_s + request.location.longitude.to_s
        @location = request.location.latitude.to_s + request.location.longitude.to_s
        if @markers.empty?
          @markers = @group.markers
          @adjust = false
          flash.now[:notice] = "There is no objects near you."
        end
      else
        @markers = @group.markers
        @location = "London"
        @adjust = false
      end
    end



    respond_to do |format|
      format.html # index.html.erb
      format.xml
    end
  end
end

