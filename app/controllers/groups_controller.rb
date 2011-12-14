class GroupsController < ApplicationController

  respond_to :json, :html

  def index
    if params[:group_title].present?
      redirect_to :action => :show, :id => Group.find_by_title(params[:group_title]), :location => params[:location]
    end
    @groups = Group.all
  end

#  def show
#    @group = Group.find(params[:id])
#    search_range = params[:search_range].blank? ? 50 : params[:search_range]
#    @location = nil
#    @markers = @group.markers
#    if params[:search].present?
#      @markers = @group.markers.near(params[:search], search_range, :order => :distance)
#      @location = params[:search]
#      if @markers.empty?
#        @markers = @group.markers
#        @adjust = false
#        flash.now[:notice] = "There is no objects near you."
#      end
#    else
#      if !request.location.city.blank?
#        @markers = @group.markers.near(request.location.country + " , " + request.location.city + " , " + request.location.address, search_range, :order => :distance)
#        params[:search] = request.location.country + " , " + request.location.city + " , " + request.location.address
#        @location = request.location.country + " , " + request.location.city + " , " + request.location.address
#        #@markers = @group.markers.near(request.location.latitude.to_s + request.location.longitude.to_s, search_range, :order => :distance)
#        #params[:search] = request.location.latitude.round(15).to_s + ", " + request.location.longitude.round(15).to_s
#        #@location = request.location.latitude.to_s + request.location.longitude.to_s
#        if @markers.empty?
#          @markers = @group.markers
#          @adjust = false
#          flash.now[:notice] = "There is no objects near you."
#        end
#      else
#        @markers = @group.markers
#        @location = "London"
#        @adjust = false
#      end
#    end



#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml
#    end
#  end

  def show
    @group = Group.find(params[:id])
    @markers = @group.markers.to_gmaps4rails
    if params[:location].present?
      @location = params[:location]
    end
  end

  def get_markers
    @group = Group.find(params[:id])
    range = params[:range].blank? ? 15 : params[:range]

    if @group.title == "Patients"

    if params[:query].present?
      @markers = @group.markers.near(params[:query], range, :order => :distance).find(:all, :joins => :user, :conditions => { :users => { :activated => true }, :published => true})
      if @markers.empty?
        @markers << @group.markers.near(params[:query], 999999999, :order => :distance).find(:all, :joins => :user, :conditions => { :users => { :activated => true }, :published => true}).first
      end
      position = Geocoder.search(params[:query])
      @group.markers.build(:latitude => position[0].latitude, :longitude => position[0].longitude, :name => "Your position", :address => "") if !position.empty?
    else
      @markers = @group.markers.find(:all, :joins => :user, :conditions => { :users => { :activated => true }, :published => true})
    end

    @result = @group.markers.near(params[:query], 999999999).find(:all, :joins => :user, :conditions => { :users => { :activated => true }, :published => true}).to_gmaps4rails do |obj, marker|
      if @markers.include?(obj) || obj.id.nil?
        marker.json "\"bounded\": true"
      else
        marker.json "\"bounded\": false"
      end
    end

    else

    if params[:query].present?

      #str = params[:query].chop
      #str.slice!(0)
      #coords = str.split(', ')

      @markers = @group.markers.near(params[:query], range, :order => :distance)
      if @markers.empty?
        #@markers = @group.markers
        @markers << @group.markers.near(params[:query], 999999999, :order => :distance).first
      end
      #@markers << Marker.new(:latitude => params[:lat].to_f, :longitude => params[:lng].to_f, :name => "Your position", :address => "") if params[:lat].present? && params[:lng].present?
      #@group.markers.build(:latitude => params[:lat].to_f, :longitude => params[:lng].to_f, :name => "Your position", :address => "") if params[:lat].present? && params[:lng].present?
      position = Geocoder.search(params[:query])
      #logger.debug position
      @group.markers.build(:latitude => position[0].latitude, :longitude => position[0].longitude, :name => "Your position", :address => "") if !position.empty?
#      im = "
#      {'description': '<h1>Your position</h1>', 'sidebar': 'Your position','lng': '#{params[:lat]}',
#  'lat': '#{params[:lng]}', 'marker_anchor': [0, true], 'rich_marker': '<img src=''/images/client_arrow.png''></img>'},
#      "
    else
      @markers = @group.markers
    end
    #@result = @markers.to_gmaps4rails

    @result = @group.markers.to_gmaps4rails do |obj, marker|
      if @markers.include?(obj) || obj.id.nil?
        marker.json "\"bounded\": true"
      else
        marker.json "\"bounded\": false"
      end
    end
    end
    respond_with @result

  end

  def sidebar
    #@marker = Marker.where(:latitude => params[:lat], :longitude => params[:lng]).first
    @markers = []
    for m in 0..params["markers"].length-1
      m =  Marker.where(:latitude => params["markers"][m.to_s]["lat"], :longitude => params["markers"][m.to_s]["lng"]).first
      @markers << m if m
    end

    #@mes = params[:markers]
    @location = params[:location]
    respond_to do |format|
      format.js
    end
  end


end

