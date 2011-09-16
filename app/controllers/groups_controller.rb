class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    if params[:search].present?
      @json = @group.markers.near(params[:search], 50, :order => :distance).to_gmaps4rails
    else
      if (!request.location.city.blank?)
        @json = @group.markers.near(request.location.country + " , " + request.location.city, 50, :order => :distance).to_gmaps4rails
        params[:search] = request.location.country + " , " + request.location.city
      else
        @json = @group.markers.to_gmaps4rails
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml
    end
  end
end

