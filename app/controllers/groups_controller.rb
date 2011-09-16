class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    if params[:search].present?
      @json = @group.markers.near(params[:search], 50, :order => :distance).to_gmaps4rails
    else
      params[:search] = request.location.city
      @json = @group.markers.to_gmaps4rails
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml
    end
  end
end

