class PacientsController < ApplicationController
  def register
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.marker = Marker.new(:address => params[:user][:location], :group => Group.find_by_title("Patients"), :name => params[:user][:name])
    @user.activated = false


    if @user.save
      UserMailer.welcome_email(@user).deliver
      UserMailer.nearest_email(@user).deliver
      render :js => "$('#dialog').parent().hide();"
    else
      render :js => "$('#dialog_errors').html('Not valid user');"
    end
  end
end

