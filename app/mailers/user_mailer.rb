class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://bakenray.com'
    mail(to: @user.email, subject:'欢迎来到 Morney')
  end
end
