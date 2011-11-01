class PacientsController < ApplicationController
  def register
    @user = User.new(params[:user])
    if @user.valid?
      @user.activated = false
      @user.marker = Marker.new(:address => params[:user][:location], :group => Group.find_by_title("Pacients"), :name => params[:user][:name])
    end

    if @user.save
      render :js => "$('#dialog').hide();"
    end
  end
end

