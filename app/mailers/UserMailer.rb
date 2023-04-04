class UserMailer < ActionMailer::Base
  default from: 'hnryacc@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end
end
