class UserMailer < ActionMailer::Base
  default :from => "vitinomics@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://vitinomics.net/posts/253-specialists"
    mail(:to => user.email, :subject => "Welcome to Vitinomics.net")
  end

  def nearest_email(user)
    @user = user
    @url  = "http://vitinomics.net/posts/253-specialists"
    @groups = Group.all
    mail(:to => user.email, :subject => "Objects nearest to you in radius of 300 miles")
  end
end

