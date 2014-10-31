class UserMailer < ActionMailer::Base
  default from: "kwoodard22@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'https://infinite-lowlands-6616.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to BillMate!')
  end
  
end
