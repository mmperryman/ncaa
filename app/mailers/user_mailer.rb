class UserMailer < ActionMailer::Base
  default :from => "mmperryman@gmail.com"
  
  def update_email(user)
    @user = user
    @url  = "http://themovinggoalpost.heroku.com"
    mail(:to => user.email,
         :subject => "Greetings from TheMovingGoalPost Pool!")
  end
end
