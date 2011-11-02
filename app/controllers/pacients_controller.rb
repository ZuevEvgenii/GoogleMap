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

  def sign_out_pacient
    @user = current_user
    sign_out @user
    respond_to do |format|
        format.js
    end
  end

  def sign_in_pacient
    @user = User.find_by_email(params[:user][:email])
    if @user.valid_password?(params[:user][:password])
      sign_in @user
      respond_to do |format|
          format.js
      end
    else
      render :js => "alert('Wrong password!');"
    end
  end

  def pacient_password_reset
    @user = User.find_by_email(params[:user][:email])
    if !@user.nil?
      @user.send_reset_password_instructions
      render :js => "alert('We have sent instructions to your email!');"
    else
      render :js => "alert('Check the email address!');"
    end
  end
end

