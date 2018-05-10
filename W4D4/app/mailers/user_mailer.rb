class UserMailer < ApplicationMailer
  default from: 'from@cat_adoptions.com'


  def welcome_email(user)
    @user = user
    @url = 'http://cat_rental.com/session/new'
    mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
